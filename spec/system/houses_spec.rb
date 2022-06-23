require 'rails_helper'

RSpec.describe "ハウス作成", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @house = FactoryBot.build(:house)
  end
  context 'ハウス作成ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('ハウスを作成する')
      # 投稿ページに移動する
      visit new_house_path
      # フォームに情報を入力する
      fill_in 'house[name]', with: @house.name
      fill_in 'house[house_introduction]', with: @house.house_introduction
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { House.count }.by(1)
      # 投稿完了ページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿したハウスの名前が存在することを確認する
      expect(page).to have_content(@house.name)
    end
  end
end

RSpec.describe 'ハウス編集', type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user1.id = 1
    @house1 = FactoryBot.create(:house)
    @house1.owner_id = 1
    @user2 = FactoryBot.create(:user)
    @user2.id = 2
    @house2 = FactoryBot.create(:house)
    @house2.owner_id = 2
  end
  context 'ハウス編集ができるとき' do
    it 'ログインしたユーザーは自分が作成したハウスの編集ができる' do
      # ハウス1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # ハウス1に「編集」へのリンクがあることを確認する
      expect(page).to have_link '編集する', href: edit_house_path(@house1.id)
      # 編集ページへ遷移する
      visit edit_tweet_path(@house1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('house[name]').value
      ).to eq(@house1.name)
      expect(
        find('house[house_introduction]').value
      ).to eq(@house1.house_introduction)
      # 投稿内容を編集する
      fill_in 'house[name]', with: "編集した名前"
      fill_in 'house[house_introduction]', with: "編集した紹介文"
      # 編集してもHouseモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { House.count }.by(0)
      # トップページに遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど変更したハウスの名前が存在することを確認する
      expect(page).to have_content("編集した名前")
    end
  end
  context 'ハウス編集ができないとき' do
    it 'ログインしたユーザーは自分以外が作成したハウスの編集画面には遷移できない' do
      # ハウス1を投稿したユーザーでログインする
      # ハウス2に「編集」へのリンクがないことを確認する
    end
  end
end

RSpec.describe 'ツイート削除', type: :system do
  before do
    @house1 = FactoryBot.create(:house)
    @house1.owner_id = 1
    @house2 = FactoryBot.create(:house)
    @house2.owner_id = 2
    @user1 = FactoryBot.create(:user)
    @user1.id = 1
    @user2 = FactoryBot.create(:user)
    @user2.id = 2
  end
  context 'ツイート削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
      # ハウス1を投稿したユーザーでログインする
      # ハウス1に「削除」へのリンクがあることを確認する
      # 投稿を削除するとレコードの数が1減ることを確認する
      # トップページに遷移したことを確認する
      # トップページにはハウス1の名前が存在しないことを確認する
    end
  end
  context 'ツイート削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
      # ハウス1を投稿したユーザーでログインする
      # ハウス2に「削除」へのリンクがないことを確認する
    end
  end
end