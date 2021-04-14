class ProductType < ApplicationRecord
  has_many :products
  validates :title, presence: true
  validates :title, length: { minimum: 3 }
  validates :title, format: { with: /[a-zA-Z0-9]/ }
end
