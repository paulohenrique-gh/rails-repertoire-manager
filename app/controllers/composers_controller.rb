class ComposersController < ApplicationController
  before_action :set_composer, only: [:show, :edit, :update]
  before_action :authorize_user, only: [:show, :edit, :update]

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

  def set_composer
    @composer = Composer.find(params[:id])
  end

  def authorize_user
    redirect_to root_path unless @composer.user == current_user
  end
end
