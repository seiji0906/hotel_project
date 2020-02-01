class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :body
      t.string :picture

      t.timestamps
    end
  end
end
