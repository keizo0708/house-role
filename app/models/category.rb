class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '全部屋共通' },
    { id: 3, name: '玄関' },
    { id: 4, name: 'リビング' },
    { id: 5, name: 'ダイニング' },
    { id: 6, name: 'キッチン' },
    { id: 7, name: '洗面所' },
    { id: 8, name: 'お風呂' },
    { id: 9, name: 'トイレ' },
    { id: 10, name: 'ベランダ' },
    { id: 11, name: '料理' },
    { id: 12, name: '掃除' },
    { id: 13, name: '洗濯' },
    { id: 14, name: '収納' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :roles
end
