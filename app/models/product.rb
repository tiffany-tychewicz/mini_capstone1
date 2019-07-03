class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
end
