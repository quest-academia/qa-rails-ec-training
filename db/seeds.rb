# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー種別
user_classification = UserClassification.create!(user_classification_name: "会社員")

# ユーザー生成（1〜3）
i = 1
user_array = %w[田中 太郎 兵庫県 神戸市], %w[鈴木 一郎 広島県 広島市], %w[佐藤 二郎 愛知県 名古屋市]
user_array.each do |first, second, third, fourth|
  user_classification.users.create!(
    last_name: first,
    first_name: second,
    zipcode: 1234567, # rubocop:disable Style/NumericLiterals
    prefecture: third,
    municipality: fourth,
    address: "123456",
    apartments: "apartment",
    email: "user_#{i}@example.com",
    phone_number: "09012345678",
    company_name: "user#{i}_company",
    delete_flag: false,
    password: "#{i}#{i}#{i}#{i}#{i}#{i}",
    password_confirmation: "#{i}#{i}#{i}#{i}#{i}#{i}",
  )
  i += 1
end

# カテゴリー
cate_array = %w[PC関連 書籍]
cate_array.each do |category|
  Category.create!(category_name: category)
end

# 販売状況
sale_st_array = %w[販売中 販売終了]
sale_st_array.each do |sale_st|
  SaleStatus.create!(sale_status_name: sale_st)
end

# 商品状態
product_st_array = %w[新品 中古]
product_st_array.each do |product_st|
  ProductStatus.create!(product_status_name: product_st)
end

# ユーザー１が持つ商品：1〜2
user1 = User.first
product_array = %w[MacBookPro13インチ 154800 M1チップ搭載\s16GB\s256GB], %w[MacMini 132800 M1チップ搭載\s16Gb\s1TB]
product_array.each do |first, second, third|
  user1.products.create!(
    product_name: first,
    price: second,
    description: third,
    category_id: 1,
    sale_status_id: 1,
    product_status_id: 1,
    delete_flag: false,
  )
end

# ユーザー１が持つ商品の仕入：1〜2
user1_products = user1.products
i = user1_products.first.id
# i = (user1.products.first).id
purchase_array = %w[109000 10 AppleJapan株式会社], %w[93000 10 AppleJapan株式会社]
purchase_array.each do |first, second, third|
  user1.products.find(i).purchases.create!(
    purchase_price: first,
    purchase_quantity: second,
    purchase_company: third,
    order_date: Time.current,
    purchase_date: Time.current,
  )
  i += 1
end

# ユーザー２が持つ商品：3〜4
user2 = User.second
product_array = %w[この一冊で全部わかるWeb技術の基本 1700 HTTP、データ形式からシステム開発まで。知識ゼロから全体像をつかめる。],
                %w[基礎からのプログラミングリテラシー 2000 コンピュータのしくみから技術書の選び方まで厳選キーワードをくらべて学ぶ！]
product_array.each do |first, second, third|
  user2.products.create!(
    product_name: first,
    price: second,
    description: third,
    category_id: 2,
    sale_status_id: 1,
    product_status_id: 1,
    delete_flag: false,
  )
end

# ユーザー２が持つ商品の仕入：3〜4
user2_products = user2.products
i = user2_products.first.id
# i = (user2.products.first).id
purchase_array = %w[1000 5 SBクリエイティブ], %w[1200 5 技術評論社]
purchase_array.each do |first, second, third|
  user2.products.find(i).purchases.create!(
    purchase_price: first,
    purchase_quantity: second,
    purchase_company: third,
    order_date: Time.current,
    purchase_date: Time.current,
  )
  i += 1
end
