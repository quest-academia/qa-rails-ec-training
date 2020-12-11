class User < ApplicationRecord
  belongs_to :user_classification
  has_many :products
end
