class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :phone, :string
    add_column :users, :team, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :text
    add_column :users, :birthday, :date
  end
end
