require 'rails_helper'

RSpec.describe Role, type: :model do
  before do
    @role = FactoryBot.build(:role)
  end

  describe 'ルール投稿' do
    context 'ルールが投稿できる場合' do
      it 'contentとcategory_idが存在していれば保存できる' do
        expect(@role).to be_valid
      end
    end
    context 'ルールが投稿できない場合' do
      it 'contentが空では保存できない' do
        @role.content = ''
        @role.valid?
        expect(@role.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが1では保存できない' do
        @role.category_id = 1
        @role.valid?
        expect(@role.errors.full_messages).to include("Category can't be blank")
      end
      it 'houseが紐付いていないと保存できない' do
        @role.house = nil
        @role.valid?
        expect(@role.errors.full_messages).to include('House must exist')
      end
    end
  end
end
