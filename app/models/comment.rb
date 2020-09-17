class Comment < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :deal
  has_one_attached :image, dependent: :destroy

end
