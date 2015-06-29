class CafesController < ApplicationController
  def index
    @cafes = Cafe.all
    @cats = Cat.all
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

end
