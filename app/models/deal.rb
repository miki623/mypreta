class Deal < ApplicationRecord

  belongs_to :item
  belongs_to :buyer
  has_many :comments
end
