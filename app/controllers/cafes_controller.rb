class CafesController < ApplicationController
  before_action :ensure_logged_in, except: :index
  before_action :ensure_cafe_owner, only: [:show, :edit, :update, :destroy]
  before_action :ensure_can_make_cafe, only: [:new, :create]

  def index
    @cafes = Cafe.all.order(name: :asc)
    @cats = Cat.all.order(name: :asc)
  end

  def show
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
  end

  def update
    @cafe.update(cafe_params)
    redirect_to @cafe
  end

  def destroy
    @cafe.destroy
    redirect_to cafes_path
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name)
  end

  def ensure_cafe_owner
    @cafe = Cafe.find(params[:id])
    redirect_to root_path unless @cafe.user == current_user
  end

  def ensure_can_make_cafe
    redirect_to root_path unless !current_user.cafes.any? || current_user.id == 1
  end

end
