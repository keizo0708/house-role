require 'rails_helper'

describe HousesController, type: :request do
  
  before do
    @house = FactoryBot.create(:house)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのhouseのnameが存在する' do 
    end
    it 'indexアクションにリクエストするとレスポンスに新規作成フォームが存在する' do 
    end
  end
end
