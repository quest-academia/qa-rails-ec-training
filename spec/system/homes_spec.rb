require "rails_helper"

RSpec.describe "Home", type: :system do
  # let(:user) { create(:user) }
  # let!(:user_balance) { create(:user_balance, user: user) }

  before do
    # sign_in user
    visit root_path
  end

  it "適切な項目が表示されること" do
    aggregate_failures do
      expect(page).to have_content "探求学園Rails専攻"
      expect(page).to have_content "ECサイト"
      # expect(page).to have_content "#{user.name} さん"
      # expect(page).to have_content user.balance

      # TODO: CSS反映させたら have_button に変更すること
      # expect(page).to have_link "コインを送る"
    end
  end

  # context "コインを送るボタンをクリックしたとき" do
  #   before do
  #     # TODO
  #   end

  #   it "送金ページに遷移すること" do
  #     # TODO
  #   end
  # end

  # context "ログアウトアイコンをクリックしたとき" do
  #   before do
  #     # TODO
  #   end

  #   it "ログアウトしてログイン画面に遷移すること" do
  #     # TODO
  #   end
  # end

  # context "ユーザーアイコンをクリックしたとき" do
  #   before do
  #     # TODO
  #   end

  #   it "ユーザー検索ページに遷移すること" do
  #     # TODO
  #   end
  # end
end
