class RemoveUserIdFromReservation < ActiveRecord::Migration[6.0]
  def down

    remove_column :reservations, :user_id, :integer
  end
end
