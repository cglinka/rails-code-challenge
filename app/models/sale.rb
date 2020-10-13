class Sale < ApplicationRecord
  belongs_to :merchant
  belongs_to :product
  belongs_to :customer
end
