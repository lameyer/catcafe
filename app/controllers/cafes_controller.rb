class CafesController < ApplicationController
  def index
    @cafes = Cafe.all
    @cats = Cat.all
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.create(cafe_params)
    redirect_to @cafe
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name)
  end

end
