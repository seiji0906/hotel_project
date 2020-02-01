class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :review_id

      t.timestamps
    end
  end
end
