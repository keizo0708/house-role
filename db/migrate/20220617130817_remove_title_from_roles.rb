class RemoveTitleFromRoles < ActiveRecord::Migration[6.0]
  def change
    remove_column :roles, :title, :string
  end
end
