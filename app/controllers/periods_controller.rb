class PeriodsController < ApplicationController
  def index
    @periods = current_user.periods
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)
    @period.user = current_user
    @period.save
    redirect_to periods_path, notice: 'Período cadastrado com sucesso'
  end

  private

  def period_params
    params.require(:period).permit(:name, :start_year, :end_year, :notes)
  end
end
