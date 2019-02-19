class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :match
      t.date :date
      t.text :description
      t.string :address
      t.integer :capacity
      t.string :fee
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
