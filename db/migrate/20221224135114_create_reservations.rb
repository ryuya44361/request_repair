class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|

      t.timestamps
      t.integer :customer_id, null: false
      t.integer :engineer_id
      t.integer :genre_id, null: false
      t.date :reservation_day, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.string :model_number, null: false
      t.string :serial_number, null: false
      t.text :introduction, null: false
      t.boolean :complete_status, null: false, default: false
    end
  end
end
