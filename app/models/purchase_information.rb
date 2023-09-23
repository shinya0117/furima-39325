class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :street_address, :build_name, :tel, :token

  with_options presence: true do
    validates :user_id 
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :street_address
    validates :tel, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token, presence: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Information.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, build_name: build_name, tel: tel, purchase_id: purchase.id)
  end
end