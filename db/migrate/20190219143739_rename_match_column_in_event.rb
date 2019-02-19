class RenameMatchColumnInEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :match, :game
  end
end
