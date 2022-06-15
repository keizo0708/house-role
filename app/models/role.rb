class Role < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :house

  validates :title, :content, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end
