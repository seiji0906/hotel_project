class AddPrefectureToHotel < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :prefecture_id, :integer
  end
end
