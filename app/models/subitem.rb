class Subitem < ApplicationRecord
  belongs_to :item
  has_many :carts
  has_one_attached :image
end
