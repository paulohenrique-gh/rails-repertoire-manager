class PiecesController < ApplicationController
  def new
    @piece = Piece.new
    @composers = current_user.composers.order(:name)
    @periods = current_user.periods.order(:name)
    @instruments = current_user.instruments.order(:name)
  end
end
