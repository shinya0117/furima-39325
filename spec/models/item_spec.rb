require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end
  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'item_imageとitem_nameとitem_infoとitem_category_idとitem_sales_status_idとsipping_fee_idとprefecture_idとsipping_day_idとitem_priceが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'item_imageが空では出品できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_catogory_idが1では出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_status_idが1では出品できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'sipping_fee_idが1では出品できない' do
        @item.sipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping fee can't be blank")
      end
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'sipping_day_idが1では出品できない' do
        @item.sipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping day can't be blank")
      end
      it 'item_priceが空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが半角英数字以外が含まれている場合出品できない' do
        @item.item_price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price は¥300から¥9,999,999の範囲で設定してください。')
      end
      it 'item_priceが300円以下の場合出品できない' do
        @item.item_price = '190'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price は¥300から¥9,999,999の範囲で設定してください。')
      end
      it 'item_priceが9,999,999円以上の場合出品できない' do
        @item.item_price = '10000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price は¥300から¥9,999,999の範囲で設定してください。')
      end
      it 'item_nameが40字以上だと出品できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'item_infoが1000字以上だと出品できない' do
        @item.item_info = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item info is too long (maximum is 1000 characters)')
      end
      it 'userが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
