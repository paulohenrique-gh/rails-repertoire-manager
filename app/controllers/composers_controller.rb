class ComposersController < ApplicationController
  def index
    @composers = current_user.composers
  end

  def new
    @composer = Composer.new
  end

  def create
    @composer = current_user.composers.build(composer_params)
    @composer.save
    redirect_to composers_path, notice: t('.success')
  end

  private

  def composer_params
    params.require(:composer).permit(:name, :period_id, :notes)
  end
end
