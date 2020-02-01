class AddPictureToPrefectures < ActiveRecord::Migration[6.0]
  def change
    add_column :prefectures, :picture, :string
  end
end
