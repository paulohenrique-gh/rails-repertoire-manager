class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:show, :edit, :update]

  def index
    @instruments = current_user.instruments
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      respond_to do |format|
        format.html { redirect_to instruments_path, notice: t('.success') }
        format.turbo_stream { flash.now[:notice] = t('.success') }
      end
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      respond_to do |format|
        format.html { redirect_to instruments_path, notice: t('.success') }
        format.turbo_stream { flash.now[:notice] = t('.success') }
      end
    else
      flash.now[:alert] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:name)
  end

  def authorize_user
    redirect_to root_path unless @instrument.user == current_user
  end
end
