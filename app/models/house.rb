class House < ApplicationRecord
  has_many :house_users
  has_many :users, through: :house_users, dependent: :destroy
  has_many :roles

  validates :name, presence: true
  validates :owner_id, presence: true
end
