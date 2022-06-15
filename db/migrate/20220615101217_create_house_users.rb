class CreateHouseUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :house_users do |t|
      t.references :house, foreign_key: true
      t.references :user,  foreign_key: true

      t.timestamps
    end
  end
end
