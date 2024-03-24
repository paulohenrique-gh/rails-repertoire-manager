class PeriodsController < ApplicationController
  def index; end

  def show
    @period = Period.find(params[:id])
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)
    if @period.save
      redirect_to @period, notice: t('.success')
    end

    flash[:alert] = 'Não foi possível cadastrar o período'
    render :new, status: :unprocessable_entity
  end

  private

  def period_params
    params.require(:period).permit(:name, :start_year, :end_year, :description)
  end
end
