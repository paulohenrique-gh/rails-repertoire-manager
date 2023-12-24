class PiecesController < ApplicationController
  def new
    @piece = Piece.new
    @composers = Composer.order(:name)
    @periods = Period.order(:name)
    @instruments = Instrument.order(:name).each { |i| i.name.capitalize }
    debugger
  end
end
