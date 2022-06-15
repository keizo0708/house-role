class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string      :title,           null: false
      t.text        :content,         null: false
      t.integer     :category_id,     null: false
      t.references  :house,           foreign_key: true

      t.timestamps
    end
  end
end
