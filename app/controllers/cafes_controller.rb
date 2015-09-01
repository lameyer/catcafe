class CafesController < ApplicationController
  before_action :ensure_logged_in, except: :index
  before_action :ensure_cafe_owner_or_admin, only: [:show, :edit, :update, :destroy]
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
    if @cafe.save
      redirect_to @cafe
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    @cafe.assign_attributes(cafe_params)
    if @cafe.save
      redirect_to @cafe
    else
      render action: :edit
    end
  end

  def destroy
    @cafe.destroy
    redirect_to cafes_path
  end

  def clean_litter_box
    @cafe = Cafe.find(params[:id])
    @cafe.update(poop_count: 0)
    redirect_to @cafe
  end

  private

  def cafe_params
    params.require(:cafe).permit(:name)
  end

  def ensure_cafe_owner_or_admin
    @cafe = Cafe.find(params[:id])
    redirect_to root_path unless @cafe.user == current_user || current_user.id == 1
  end

  def ensure_can_make_cafe
    redirect_to root_path unless !current_user.cafes.any? || current_user.id == 1
  end

end
