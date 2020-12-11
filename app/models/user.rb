class User < ApplicationRecord
  belongs_to :user_classification

  validates :user_classification_id, :presence => true
end
