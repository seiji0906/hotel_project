class AddHotelnameToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :hotelname, :string
  end
end
