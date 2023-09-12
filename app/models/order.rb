class Order < ApplicationRecord
    belongs_to :subitem
    belongs_to :user
end
