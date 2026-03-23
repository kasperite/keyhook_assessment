class AddListingIdToAvailabilities < ActiveRecord::Migration[8.1]
  def change
    remove_column :availabilities, :user_id, :bigint
    add_reference :availabilities, :listing, null: false, foreign_key: true
    add_index :availabilities, [:listing_id, :start_time, :end_time], unique: true
  end
end
