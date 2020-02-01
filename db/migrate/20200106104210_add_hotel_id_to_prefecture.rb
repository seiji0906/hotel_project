class AddHotelIdToPrefecture < ActiveRecord::Migration[6.0]
  def change
    add_column :prefectures, :hotel_id, :integer
  end
end
