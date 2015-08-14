class CatsController < ApplicationController

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    redirect_to root_path unless current_user.id == 1
    @cat = Cat.new
  end

  def create
    redirect_to root_path unless current_user.id == 1
    @cat = Cat.create(cat_params)
    redirect_to @cat
  end

  def edit
    redirect_to root_path unless current_user.id == 1
    @cat = Cat.find(params[:id])
  end

  def update
    redirect_to root_path unless current_user.id == 1
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to @cat
  end

  def destroy
    redirect_to root_path unless current_user.id == 1
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to cafes_path
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :gender, :breed, :color, :personality)
  end

end
