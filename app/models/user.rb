class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－]+\z/, message: "は全角の漢字・ひらがな・カタカナで入力してください" }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－]+\z/, message: "は全角の漢字・ひらがな・カタカナで入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角のカタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角のカタカナで入力してください" }
  validates :birth_date, presence: true
  validates :password_conplexity, presence: true

  private

  def password_conplexity
    if password.present? && (password !~ /^(?=.*[a-zA-Z])(?=.*\d).{6,}$/)
      errors.add(:password, "は英字と数字を含む6文字以上で設定してください")
    end
  end
end
