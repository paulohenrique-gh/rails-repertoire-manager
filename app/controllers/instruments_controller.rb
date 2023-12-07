class InstrumentsController < ApplicationController
  def index
    @instruments = current_user.instruments
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    redirect_to instruments_path, notice: 'Instrumento cadastrado com sucesso'
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name)
  end
end
