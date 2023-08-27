class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    #@items = Item.all
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

  private
  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_info, :item_category_id, :item_sales_status_id, :sipping_fee_id, :prefecture_id, :sipping_day_id, :item_price).merge(user_id: current_user.id)
  end

end
