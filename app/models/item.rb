class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :item_image
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :sipping_fee
  belongs_to :prefecture
  belongs_to :sipping_day

  validates :content, presence: true, unless: :was_attached?
  
  def was_attached?
    self.item_image.attached?
  end

  validates :item_name, presence:true
  validates :item_info, presence:true
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sipping_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_price, presence:true
  validates :item_price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: "は300から9,999,999の間で設定してください。"
  }
end
