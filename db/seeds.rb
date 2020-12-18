# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_classification = UserClassification.create!(
  user_classification_name: "会社員",
)

user_classification.users.create!(
  last_name: "田中",
  first_name: "太郎",
  zipcode: 1234567,
  prefecture: "兵庫県",
  municipality: "神戸市",
  address: "123456",
  apartments: "apartment",
  email: "tanakataro@example.com",
  phone_number: "123456789012345",
  company_name: "tanakacampany",
  delete_flag: true,
  password: "abc123",
  password_confirmation: "abc123",
)
