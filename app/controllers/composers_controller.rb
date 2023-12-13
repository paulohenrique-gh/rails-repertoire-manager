class ComposersController < ApplicationController
  def index
  end

  def new
    @composer = Composer.new
  end
end
