class CafesController < ApplicationController
  def index
    @cafes = Cafe.all.order(name: :asc)
    @cats = Cat.all.order(name: :asc)
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.new(cafe_params)
    @cafe.user = current_user
    @cafe.save!
    redirect_to @cafe
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def update
    @cafe = Cafe.find(params[:id])
    @cafe.update(cafe_params)
    redirect_to @cafe
  end

  def destroy
    @cafe = Cafe.find(params[:id])
    @cafe.destroy
    redirect_to cafes_path
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name)
  end

end
