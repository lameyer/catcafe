class CafeItemsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_cafe_owner

  def new
    @items = Item.all
    @cafe_item = CafeItem.new
  end

  def create
    @cafe_item = CafeItem.new(cafe_items_params)
    if @cafe_item.save
      redirect_to @cafe
    else
      flash[:error] = @cafe_item.errors[:base].join
      redirect_to new_cafe_cafe_item_path
    end
  end

  def destroy
    @cafe_item = CafeItem.find(params[:id])
    if !@cafe_item.destroy
      flash[:error] = @cafe_item.errors[:base].join
    end
    redirect_to @cafe
  end

  private

  def cafe_items_params
    params.permit(:cafe_id, :item_id)
  end

  def ensure_cafe_owner
    @cafe = Cafe.find(params[:cafe_id])
    redirect_to root_path unless @cafe.user == current_user
  end

end
