class UserClassification < ApplicationRecord
  has_many :users

  validates :user_classification_name, presence: true
end
