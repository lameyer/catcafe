class CafeItemsController < ApplicationController

  def new
    @cafe = Cafe.find(params[:cafe_id])
    redirect_to root_path unless @cafe.user == current_user
    @items = Item.all
    @cafe_item = CafeItem.new
  end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    redirect_to root_path unless @cafe.user == current_user
    @cafe_item = CafeItem.create(cafe_items_params)
    redirect_to @cafe
  end

  def destroy
    @cafe = Cafe.find(params[:cafe_id])
    redirect_to root_path unless @cafe.user == current_user
    @cafe_item = CafeItem.find(params[:id])
    @cafe_item.destroy
    redirect_to @cafe
  end

  private

  def cafe_items_params
    params.permit(:cafe_id, :item_id)
  end

end
