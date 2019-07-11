class CategoryProduct < ApplicationRecord
  belongs_to :categories
  belongs_to :products
end
