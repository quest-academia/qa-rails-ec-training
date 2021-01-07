require "rails_helper"

RSpec.describe "Signup", type: :system do
  before { visit signup_path }

  it "フォームが表示されること" do
    aggregate_failures do
      expect(page).to have_content "お客様情報登録"
      expect(page).to have_content "登録"
      expect(page).to have_button "登録"
      expect(page).to have_link "ログインはこちら"
    end
  end

  context "正しい値が入力される時" do
    before do
      fill_in "姓", with: "田中"
      fill_in "名", with: "太郎"
      fill_in "郵便番号", with: 1234567
      fill_in "都道府県", with: "東京都"
      fill_in "市区町村", with: "品川区"
      fill_in "番地", with: "南品川4-15-5"
      fill_in "マンション・部屋番号", with: "909"
      fill_in "メールアドレス", with: "user@test.com"
      fill_in "電話番号", with: "0311112222"
      fill_in "パスワード", with: 111111
      fill_in "パスワード再入力", with: 111111
      click_button "登録"
    end

    it "登録に成功すること" do
      aggregate_failures do
        expect(page).to have_content "新規登録に成功しました。"
        expect(page).to have_current_path user_path
        expect(page).to have_content "#{user.last_name} #{user.first_name} さん"
      end
    end
  end
end
