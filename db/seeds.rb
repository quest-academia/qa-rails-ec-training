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
puts "User [#{User.count}data] Create!" # rubocop:disable Rails/Output

# カテゴリー
%w[PC関連 書籍 衣料品 食料品].each do
  Category.create!(category_name: _1)
end
puts "Category [#{Category.count}data] Create!" # rubocop:disable Rails/Output

# 販売状況
%w[販売中 販売終了].each do
  SaleStatus.create!(sale_status_name: _1)
end
puts "SaleStatus [#{SaleStatus.count}data] Create!" # rubocop:disable Rails/Output

# 商品状態
%w[新品 中古].each do
  ProductStatus.create!(product_status_name: _1)
end
puts "ProductStatus [#{ProductStatus.count}data] Create!" # rubocop:disable Rails/Output

# ユーザー１が持つ商品＆仕入：25件（PC関連）
user1 = User.first
[
  %w[\[APPLE\]\ MacBookPro13インチ 134800 M1チップ搭載\ 8GB\ 256GB 95000 10 AppleJapan株式会社],
  %w[\[APPLE\]\ MacBookPro13インチ 154800 M1チップ搭載\ 8GB\ 512GB 109000 10 AppleJapan株式会社],
  %w[\[APPLE\]\ MacBookPro13インチ 174800 M1チップ搭載\ 8GB\ 1TB 120000 10 AppleJapan株式会社],
  %w[\[APPLE\]\ MacBookPro13インチ 154800 M1チップ搭載\ 16GB\ 256GB 109000 10 AppleJapan株式会社],
  %w[\[APPLE\]\ MacBookPro13インチ 174800 M1チップ搭載\ 16GB\ 512GB 120000 10 AppleJapan株式会社],
  %w[\[APPLE\]\ MacBookPro13インチ 194800 M1チップ搭載\ 16GB\ 1TB 136000 10 AppleJapan株式会社],
  %w[\[APPLE\]\ MacMini\[8\ 512\] 92800 M1チップ搭載\ 8Gb\ 512GB 65000 15 AppleJapan株式会社],
  %w[\[APPLE\]\ MacMini\[8\ 1T\] 112800 M1チップ搭載\ 8Gb\ 1TB 90000 15 AppleJapan株式会社],
  %w[\[APPLE\]\ MacMini\[16\ 512\] 112800 M1チップ搭載\ 16Gb\ 512GB 90000 15 AppleJapan株式会社],
  %w[\[APPLE\]\ MacMini\[16\ 1T\] 132800 M1チップ搭載\ 16Gb\ 1TB 93000 15 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[64\ W\] 74800 64GB\ ホワイト 52000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[64\ Bk\] 74800 64GB\ ブラック 52000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[64\ Bl\] 74800 64GB\ ブルー 52000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[64\ G\] 74800 64GB\ グリーン 52000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[64\ R\] 74800 64GB\ レッド 52000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[128\ W\] 79800 128GB\ ホワイト 58000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[128\ Bk\] 79800 128GB\ ブラック 58000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[128\ Bl\] 79800 128GB\ ブルー 58000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[128\ G\] 79800 128GB\ グリーン 58000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[128\ R\] 79800 128GB\ レッド 58000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[256\ W\] 90800 256GB\ ホワイト 63000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[256\ Bk\] 90800 256GB\ ブラック 63000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[256\ Bl\] 90800 256GB\ ブルー 63000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[256\ G\] 90800 256GB\ グリーン 63000 5 AppleJapan株式会社],
  %w[\[APPLE\]\ iPhone\ Mini\[256\ R\] 90800 256GB\ レッド 63000 5 AppleJapan株式会社],
].each.with_index(1) do |(first, second, third, fourth, fifth, sixth), i|
  user1.products.create!(
    product_name: first, price: second, description: third, category_id: 1, sale_status_id: 1, product_status_id: 1, delete_flag: false,
  )
  user1.products.find(i).purchases.create!(
    purchase_price: fourth, purchase_quantity: fifth, purchase_company: sixth, order_date: Time.current, purchase_date: Time.current,
  )
end
puts "User1 - Product & Purchase [#{Product.where(user_id: 1).count}data] Create!" # rubocop:disable Rails/Output

# ユーザー２が持つ商品＆仕入：4件（書籍）
user2 = User.second
[
  %w[この一冊で全部わかるWeb技術の基本 1700 HTTP、データ形式からシステム開発まで。知識ゼロから全体像をつかめる。 1000 5 SBクリエイティブ],
  %w[基礎からのプログラミングリテラシー 2000 コンピュータのしくみから技術書の選び方まで厳選キーワードをくらべて学ぶ！ 1200 5 技術評論社],
  %w[知識ゼロからのプログラミング学習術 1650 プログラミングスキルを上げる方法を満載。Kindle版は743円！ 1100 5 秀和システム],
  %w[プロになるためのWeb技術入門 2500 Webアプリケーションの開発方法を,インターネットの仕組みの根本原理から,じっくり解説します。 1750 5 技術評論社],
].each do |first, second, third, fourth, fifth, sixth|
  product = user2.products.create!(
    product_name: first, price: second, description: third, category_id: 2, sale_status_id: 1, product_status_id: 1, delete_flag: false,
  )
  user2.products.find(product.id).purchases.create!(
    purchase_price: fourth, purchase_quantity: fifth, purchase_company: sixth, order_date: Time.current, purchase_date: Time.current,
  )
end
puts "User2 - Product & Purchase [#{Product.where(user_id: 2).count}data] Create!" # rubocop:disable Rails/Output

# 発送状態
# shipment_status = ShipmentStatus.create!(shipment_status_name: "入荷待ち")
# shipment_status2 = ShipmentStatus.create!(shipment_status_name: "準備中")

# ユーザー1が持つ注文
user1 = User.first
user1.orders.create!(order_date: Time.current)
shipment_status = ShipmentStatus.create!(shipment_status_name: "入荷待ち")
puts "ShipmentStatus Create!" # rubocop:disable Rails/Output

# ユーザー1が持つ注文
user1 = User.first
user1.orders.create!(order_date: Time.current)

# ユーザー2が持つ注文
user2 = User.second
user2.orders.create!(order_date: Time.current)

# ユーザー3が持つ注文
user3 = User.third
user3.orders.create!(order_date: Time.current)

puts "Order [#{Order.count}data] Create!" # rubocop:disable Rails/Output

# オーダー1が持つ注文の詳細
order1 = Order.first
order1.order_details.create!(
  product_id: 1,
  shipment_status_id: 1,
  order_detail_number: "foobar123",
  order_quantity: 1,
  shipment_date: Time.current,
)
order1.order_details.create!(
  product_id: 1,
  shipment_status_id: 1,
  order_detail_number: "foobar999",
  order_quantity: 3,
  shipment_date: Time.current,
)
order1.order_details.create!(
  product_id: 2,
  shipment_status_id: 2,
  order_detail_number: "foobar777",
  order_quantity: 2,
  shipment_date: Time.current,
)

# オーダー2が持つ注文の詳細
order2 = Order.second
order2.order_details.create!(
  product_id: 2,
  shipment_status_id: 1,
  order_detail_number: "foobar456",
  order_quantity: 1,
  shipment_date: Time.current,
)

# オーダー3が持つ注文の詳細
order3 = Order.third
order3.order_details.create!(
  product_id: 3,
  order_id: 3,
  shipment_status_id: 1,
  order_detail_number: "foobar789",
  order_quantity: 1,
  shipment_date: Time.current,
)
puts "OrderDetail [#{OrderDetail.count}data] Create!" # rubocop:disable Rails/Output

puts "\nSeeds All Success!!" # rubocop:disable Rails/Output
