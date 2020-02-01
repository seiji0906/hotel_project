class AddHotelIdToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :hotel_id, :integer
  end
end
