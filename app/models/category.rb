class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :category_name, presence: true
end
