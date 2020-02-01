class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :rooms
      t.integer :adults
      t.integer :children
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
