class InstrumentsController < ApplicationController
  def index
    @instruments = current_user.instruments
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      redirect_to instruments_path, notice: 'Instrumento cadastrado com sucesso'
    else
      flash.now[:alert] = 'Não foi possível cadastrar instrumento'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    redirect_to instruments_path, notice: 'Instrumento atualizado com sucesso'
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name)
  end
end
