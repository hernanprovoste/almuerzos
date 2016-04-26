class SalidasController < ApplicationController
  before_action :set_salida, only: [:show, :edit, :update, :destroy]

  # GET /salidas
  # GET /salidas.json
  def index
    @salidas = Salida.all
  end

  # GET /salidas/1
  # GET /salidas/1.json
  def show
  end

  # GET /salidas/new
  def new
    @salida = Salida.new
  end

  # GET /salidas/1/edit
  def edit
  end

  # POST /salidas
  # POST /salidas.json
  def create
    @salida = Salida.new(salida_params)

    respond_to do |format|
      if @salida.save
        format.html { redirect_to @salida, notice: 'Salida was successfully created.' }
        format.json { render :show, status: :created, location: @salida }
      else
        format.html { render :new }
        format.json { render json: @salida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salidas/1
  # PATCH/PUT /salidas/1.json
  def update
    respond_to do |format|
      if @salida.update(salida_params)
        format.html { redirect_to @salida, notice: 'Salida was successfully updated.' }
        format.json { render :show, status: :ok, location: @salida }
      else
        format.html { render :edit }
        format.json { render json: @salida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salidas/1
  # DELETE /salidas/1.json
  def destroy
    @salida.destroy
    respond_to do |format|
      format.html { redirect_to salidas_url, notice: 'Salida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salida
      @salida = Salida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salida_params
      params.require(:salida).permit(:fecha)
    end
end
