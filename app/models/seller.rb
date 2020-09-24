class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :deals

  def self.guest
    find_or_create_by!(email: 'seller_guest@example.com') do |seller|
      seller.password = "guest11"
      seller.nickname = "ゲストユーザー"
      seller.first_name = "ゲスト"
      seller.last_name = "ユーザー"
      seller.first_name_kana = "ゲスト"
      seller.last_name_kana = "ユーザー"
      seller.birth_date = "1950-05-05"
      seller.jender = "男"
      seller.info = "アパレルデザイナー歴10年"
      seller.schedule = "土日終日対応可"
    end
  end

  VALID_NAME_REGIX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGIX = /\A[ァ-ヶー－]+\z/
  VALID_PASS_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: VALID_PASS_REGIX, message: "は文字と数字の両方を含めてください"}
    validates :first_name, format: { with: VALID_NAME_REGIX, message: "は全角で入力してください"}
    validates :last_name, format: { with: VALID_NAME_REGIX, message: "は全角で入力してください"}
    validates :first_name_kana, format: { with: VALID_KANA_REGIX, message: "は全角カタカナで入力してください"}
    validates :last_name_kana, format: { with: VALID_KANA_REGIX, message: "は全角カタカナで入力してください"}
    validates :birth_date
    validates :jender
    validates :info, length: { maximum: 1000 }
    validates :schedule
  end
       
end
