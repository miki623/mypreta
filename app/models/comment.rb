class Comment < ApplicationRecord
  belongs_to :seller, optional: true
  belongs_to :buyer, optional: true
  belongs_to :deal
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :text, length: { maximum: 1500 }
    validates :deal_id
  end

end
