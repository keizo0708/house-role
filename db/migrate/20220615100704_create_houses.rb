class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string  :name,                null: false
      t.text    :house_introduction
      t.integer :owner_id,            null: false

      t.timestamps
    end
  end
end
