class Deal < ApplicationRecord

  belongs_to :item
  belongs_to :buyer
  
end
