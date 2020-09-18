class Deal < ApplicationRecord

  belongs_to :item
  belongs_to :buyer
  belongs_to :seller
  has_many :comments
end
