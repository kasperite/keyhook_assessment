class CreateAvailabilities < ActiveRecord::Migration[8.1]
  def change
    create_table :availabilities do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :status, default: 0
      t.belongs_to :user, null: false, foreign_key: true

      t.index [:user_id, :start_time, :end_time], unique: true
      t.timestamps
    end
  end
end
