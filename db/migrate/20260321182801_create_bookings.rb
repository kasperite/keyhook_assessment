class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :mobile, null: false
      t.string :email, null: false
      t.text :message
      t.boolean :sms_reminder, default: false
      t.boolean :over_eighteen, default: false, null: false
      t.belongs_to :availability, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
