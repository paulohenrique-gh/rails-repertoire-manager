class ComposersController < ApplicationController
  def index
    @composers = current_user.composers
  end

  def show
    @composer = Composer.find(params[:id])
  end

  def new
    @composer = Composer.new
  end

  def create
    @composer = current_user.composers.build(composer_params)
    if @composer.save
      redirect_to composers_path, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @composer = Composer.find(params[:id])
  end

  def update
    @composer = Composer.find(params[:id])
    if @composer.update(composer_params)
      redirect_to @composer, notice: t('.success')
    else
      flash.now[:alert] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def composer_params
    params.require(:composer).permit(:name, :period_id, :notes)
  end
end
