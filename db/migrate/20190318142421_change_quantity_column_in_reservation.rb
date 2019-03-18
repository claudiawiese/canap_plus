class ChangeQuantityColumnInReservation < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :quantity, :integer, default: 0
  end
end
