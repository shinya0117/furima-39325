require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_information = FactoryBot.build(:purchase_information, user_id: @user.id, item_id: @item.id)
  end
  describe '配送先情報登録' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_information).to be_valid
      end
      it 'build_nameは空でも保存できる' do
        @purchase_information.build_name = ''
        expect(@purchase_information).to be_valid
      end
    end

    context '内容に問題があるとき' do
      it 'postal_codeが空だと保存できない' do
        @purchase_information.postal_code = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_information.postal_code = '12345678'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_information.prefecture_id = 0
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できない' do
        @purchase_information.municipalities = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空だと保存できない' do
        @purchase_information.street_address = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telが空だと保存できない' do
        @purchase_information.tel = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telがハイフンを含まない正しい形式でないと保存できない' do
        @purchase_information.tel = '090-1234-5678'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Tel is invalid')
      end
      it 'telの桁数が9桁以下だと保存できない' do
        @purchase_information.tel = '09012345'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include('Tel is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_information.user_id = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_information.item_id = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_information.token = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
