class PiecesController < ApplicationController
  def index

  end

  def new
    @piece = Piece.new
    @composers = current_user.composers.order(:name)
    @periods = current_user.periods.order(:name)
    @instruments = current_user.instruments.order(:name)
  end

  def create
    @piece = current_user.pieces.build(piece_params)
    if @piece.save
      redirect_to pieces_path, notice: t('.success')
    else
      @piece = Piece.new
      @composers = current_user.composers.order(:name)
      @periods = current_user.periods.order(:name)
      @instruments = current_user.instruments.order(:name)
      flash.now[:alert] = t('.failure')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def piece_params
    params.require(:piece).permit(
      :title,
      :opus,
      :number,
      :movement,
      :other_identifiers,
      :composer_id,
      :period_id,
      :instrument_id,
      :start_date,
      :finish_date,
      :difficulty_level
    )
  end
end
