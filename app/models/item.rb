class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :seller
  has_one_attached :image, dependent: :destroy
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  has_many :deals
  has_many :buyers, through: :deals

  with_options presence: true do
    validates :image
    validates :overview, length: { maximum: 200}
    validates :info, length: { maximum: 1000 }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 5000, less_than_or_equal_to: 500000}
    validates :category
    validates :delivery_fee
    validates :shipping_area
  end


end
