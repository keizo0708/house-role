require 'rails_helper'

RSpec.describe House, type: :model do
  before do
    @house = FactoryBot.build(:house)
  end

  describe 'ハウスの保存' do
    context 'ハウスが作成できる場合' do
      it 'nameとowner_idが存在すれば登録できる' do
        expect(@house).to be_valid
      end
    end
    context 'ハウスが作成できない場合' do
      it 'nameが空では作成できない' do
        @house.name = ''
        @house.valid?
        expect(@house.errors.full_messages).to include "Name can't be blank"
      end     
      it 'owner_idが空では作成できない' do
        @house.owner_id = ''
        @house.valid?
        expect(@house.errors.full_messages).to include "Owner can't be blank"
      end
    end
  end
end
