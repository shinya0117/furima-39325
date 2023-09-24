class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  has_one :purchase
  has_one_attached :item_image
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :sipping_fee
  belongs_to :prefecture
  belongs_to :sipping_day
  
  validates :item_image, presence: true
  validates :item_name, presence: true, length: { minimum: 1, maximum: 40 }
  validates :item_info, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, presence: true, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'は¥300から¥9,999,999の範囲で設定してください。',
    only_integer: true
  }

end
