class CreateListings < ActiveRecord::Migration[8.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :photo
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
