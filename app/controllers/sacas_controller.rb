class SacasController < ApplicationController
  before_action :set_saca, only: [:show, :edit, :update, :destroy]

  # GET /sacas
  # GET /sacas.json
  def index
    if params[:search]
      if Persona.exists?(rut: params[:search])
        @persona_id = Persona.find_by(rut: params[:search]).id        
        if @persona_id.present?
          @mes = Time.now.month
          @c = Saca.where("persona_id = ?", @persona_id).where("created_at >= ?", Date.today.at_beginning_of_month).count
          @sacas = Saca.where("persona_id = ?", @persona_id)
          redirect_to new_saca_path(@saca, fecha: Time.new, persona_id: @persona_id, c: @c)
        else 
          @sacas = Saca.where(persona_id: @persona_id).order("created_at DESC")
        end
      else
        @sacas = Saca.all.order("created_at DESC").limit(1)
      end
    else
      @sacas = Saca.all.order("created_at DESC").limit(1)
    end
    
  end

  # GET /sacas/1
  # GET /sacas/1.json
  def show
  end

  # GET /sacas/new
  def new
    @fecha = params[:fecha]
    @persona_id = params[:persona_id]
    @c = params[:c]
    @sacas = Saca.where("persona_id = ?", @persona_id)
    @saca = Saca.new(fecha: @fecha, persona_id: @persona_id)
  end

  # GET /sacas/1/edit
  def edit
  end

  # POST /sacas
  # POST /sacas.json
  def create
    @saca = Saca.new(saca_params)
    respond_to do |format|
      if @saca.save
        format.html { redirect_to action: "index", notice: 'Saca was successfully created.' }
        format.json { render :index, status: :created}
      else
        format.html { render :new }
        format.json { render json: @saca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sacas/1
  # PATCH/PUT /sacas/1.json
  def update
    respond_to do |format|
      if @saca.update(saca_params)
        format.html { redirect_to @saca, notice: 'Saca was successfully updated.' }
        format.json { render :show, status: :ok, location: @saca }
      else
        format.html { render :edit }
        format.json { render json: @saca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sacas/1
  # DELETE /sacas/1.json
  def destroy
    @saca.destroy
    respond_to do |format|
      format.html { redirect_to sacas_url, notice: 'Saca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saca
      @saca = Saca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saca_params
      params.require(:saca).permit(:fecha, :persona_id)
    end
end
