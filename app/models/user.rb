class User < ApplicationRecord
  before_save { self.email = email.downcase }
  belongs_to :user_classification, optional: true
  has_many :products, dependent: :destroy
  has_many :orders

  validates :last_name, :first_name, :zipcode, :municipality, :prefecture, :address, :apartments, :email, :phone_number, :password, presence: true
  validates :last_name, :first_name, length: { maximum: 10 }
  validates :zipcode, format: { with: /\A[a-z0-9]+\z/i }, length: { is: 7 }, allow_blank: true
  validates :municipality, length: { maximum: 10 }
  validates :prefecture, length: { maximum: 5 }
  validates :address, :apartments, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :phone_number, format: { with: /\A[a-z0-9]+\z/i }, length: { maximum: 15 }, allow_blank: true
  validates :delete_flag, inclusion: { in: [true, false] }
  has_secure_password
  validates :password, length: { in: 6..15 }, format: { with: /\A[a-z0-9]+\z/i }, allow_blank: true
end
