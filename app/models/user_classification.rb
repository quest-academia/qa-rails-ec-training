class UserClassification < ApplicationRecord
  has_many :users, dependent: :nullify

  validates :user_classification_name, presence: true
end
