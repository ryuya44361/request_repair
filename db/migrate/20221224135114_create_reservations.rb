class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :engineer_id, null: false
      t.integer :genre_id, null: false
      t.integer :restriction_id, null: false
      t.datetime :reservation_at, null: false
      t.string :model_number, null: false
      t.string :serial_number, null: false
      t.text :introduction, null: false
    end
  end
end
