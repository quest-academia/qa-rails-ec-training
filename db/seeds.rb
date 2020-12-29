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
[
  %w[田中 太郎 兵庫県 神戸市], %w[鈴木 一郎 愛知県 名古屋市], %w[佐藤 二郎 静岡県 静岡市]
].each.with_index(1) do |(first, second, third, fourth), i|
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
end

# カテゴリー
%w[PC関連 書籍].each do
  Category.create!(category_name: _1)
end

# 販売状況
%w[販売中 販売終了].each do
  SaleStatus.create!(sale_status_name: _1)
end

# 商品状態
%w[新品 中古].each do
  ProductStatus.create!(product_status_name: _1)
end

# ユーザー１が持つ商品：1〜2
user1 = User.first
[
  %w[MacBookPro13インチ 154800 M1チップ搭載\ 16GB\ 256GB], %w[MacMini 132800 M1チップ搭載\ 16Gb\ 1TB]
].each do
  user1.products.create!(
    product_name: _1,
    price: _2,
    description: _3,
    category_id: 1,
    sale_status_id: 1,
    product_status_id: 1,
    delete_flag: false,
  )
end

# ユーザー１が持つ商品の仕入：1〜2
[
  %w[109000 10 AppleJapan株式会社], %w[93000 10 AppleJapan株式会社]
].each.with_index(1) do |(first, second, third), i|
  user1.products.find(i).purchases.create!(
    purchase_price: first,
    purchase_quantity: second,
    purchase_company: third,
    order_date: Time.current,
    purchase_date: Time.current,
  )
end

# ユーザー２が持つ商品：3〜4
user2 = User.second
[
  %w[この一冊で全部わかるWeb技術の基本 1700 HTTP、データ形式からシステム開発まで。知識ゼロから全体像をつかめる。],
  %w[基礎からのプログラミングリテラシー 2000 コンピュータのしくみから技術書の選び方まで厳選キーワードをくらべて学ぶ！],
].each do
  user2.products.create!(
    product_name: _1,
    price: _2,
    description: _3,
    category_id: 2,
    sale_status_id: 1,
    product_status_id: 1,
    delete_flag: false,
  )
end

# ユーザー２が持つ商品の仕入：3〜4
[
  %w[1000 5 SBクリエイティブ], %w[1200 5 技術評論社]
].each.with_index(3) do |(first, second, third), i|
  user2.products.find(i).purchases.create!(
    purchase_price: first,
    purchase_quantity: second,
    purchase_company: third,
    order_date: Time.current,
    purchase_date: Time.current,
  )
end



# 発送状態
shipment_status = ShipmentStatus.create!(shipment_status_name: "入荷待ち")

# ユーザー1が持つ注文
user1 = User.first
user1.orders.create!(order_date: Time.now)
  
# ユーザー2が持つ注文
user2 = User.second
user2.orders.create!(order_date: Time.now)

# ユーザー3が持つ注文
user3 = User.third
user3.orders.create!(order_date: Time.now)

# オーダー1が持つ注文の詳細
order1 = Order.first
order1.order_details.create!(
  product_id: 1,
  order_id: 1,
  shipment_status_id: 1,
  order_detail_number: "foobar123",
  order_quantity: 1,
  shipment_date: Time.now
  )

# オーダー2が持つ注文の詳細
order2 = Order.second
order2.order_details.create!(
  product_id: 2,
  order_id: 2,
  shipment_status_id: 1,
  order_detail_number: "foobar456",
  order_quantity: 1,
  shipment_date: Time.now
  )

# オーダー3が持つ注文の詳細
order3 = Order.third
order3.order_details.create!(
  product_id: 3,
  order_id: 3,
  shipment_status_id: 1,
  order_detail_number: "foobar789",
  order_quantity: 1,
  shipment_date: Time.now
  )