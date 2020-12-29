class User < ApplicationRecord
  before_save { self.email = email.downcase }
  belongs_to :user_classification, optional: true
  has_many :products, dependent: :destroy
  has_many :orders
  
  has_secure_password
  validates :password, presence: true, length: { in: 6..15 }, format: { with: /\A[a-z0-9]+\z/i }
  validates :last_name, :first_name, :municipality, presence: true, length: { maximum: 10 }
  validates :zipcode, presence: true, format: { with: /\A[a-z0-9]+\z/i }, length: { is: 7 }
  validates :prefecture, presence: true, length: { maximum: 5 }
  validates :address, :apartments, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, format: { with: /\A[a-z0-9]+\z/i }, length: { maximum: 15 }
  validates :delete_flag, inclusion: { in: [true, false] }
end
