class PeriodsController < ApplicationController
  def index
    @periods = current_user.periods
  end

  def show
    @period = Period.find(params[:id])
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)
    @period.user = current_user
    if @period.save
      redirect_to periods_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @period = Period.find(params[:id])
  end

  def update
    @period = Period.find(params[:id])
    if @period.update(period_params)
      redirect_to periods_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def period_params
    params.require(:period).permit(:name, :start_year, :end_year, :notes)
  end
end
