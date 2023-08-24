class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :item_image
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :sipping_fee
  belongs_to :prefecture
  belongs_to :sipping_day

  validates :item_image, presence: true, unless: :was_attached?
  
  def was_attached?
    self.item_image.attached?
  end

  validates :item_name, presence:true, length: { minimum: 1, maximum: 40 }
  validates :item_info, presence:true, length: { minimum: 1, maximum: 1000 }
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_price, presence: true, format: {
    with: /\A(?:[3-9]\d{2}|[1-9]\d{4,6})\z/,
    message: "は¥300から¥9,999,999の範囲で設定してください。"
  }
end
