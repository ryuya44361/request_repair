class CreateRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :restrictions do |t|

      t.timestamps
      t.date :reservation_day, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.integer :headcount, null: false
    end
  end
end
