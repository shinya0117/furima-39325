class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :items

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－々]+\z/, message: "全角文字を使用してください" }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－々]+\z/, message: "全角文字を使用してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角のカタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "全角のカタカナで入力してください" }
  validates :birth_date, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
