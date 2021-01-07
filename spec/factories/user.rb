FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) {|n| "#{n}_test@example.com" }
    sequence(:account_name) {|n| "#{n}_account_name" }
    password { Faker::Internet.password(min_length: 6, max_length: 12, mix_case: true) }
    admin { false }
  end
end
