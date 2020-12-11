class Purchase < ApplicationRecord
  belongs_to :product
  
  validates :purchase_price, :purchase_quanity, :purchase_company, presence: true
  
  # 発送日:order_date, 納入日:purchase_dateについて、日時の前後関係のバリデーション
end
