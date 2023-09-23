class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.errors.messages.values.each(&:uniq!)
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id || @item.purchase.present?
      redirect_to root_path
    end 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      @item.errors.messages.values.each(&:uniq!)
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_category_id, :item_sales_status_id, :sipping_fee_id,
                                 :prefecture_id, :sipping_day_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
