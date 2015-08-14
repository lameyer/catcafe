class CafesController < ApplicationController
  def index
    @cafes = Cafe.all.order(name: :asc)
    @cats = Cat.all.order(name: :asc)
  end

  def show
    @cafe = Cafe.find(params[:id])
    redirect_to root_path unless @cafe.user == current_user
  end

  def new
    @cafe = Cafe.new
    redirect_to root_path unless !current_user.cafes.any? || current_user.id == 1
  end

  def create
    @cafe = Cafe.new(cafe_params)
    redirect_to root_path unless !current_user.cafes.any? || current_user.id == 1
    @cafe.user = current_user
    @cafe.save!
    redirect_to @cafe
  end

  def edit
    @cafe = Cafe.find(params[:id])
    redirect_to root_path unless @cafe.user == current_user
  end

  def update
    @cafe = Cafe.find(params[:id])
    redirect_to root_path unless @cafe.user == current_user
    @cafe.update(cafe_params)
    redirect_to @cafe
  end

  def destroy
    @cafe = Cafe.find(params[:id])
    redirect_to root_path unless @cafe.user == current_user
    @cafe.destroy
    redirect_to cafes_path
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name)
  end

end
