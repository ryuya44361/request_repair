class CreateRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :restrictions do |t|

      t.timestamps
      t.integer :default_limit_id, null: false
      t.date :reservation_day, null: false
      t.integer :headcount, null: false, default: 0
      t.integer :update_status, null: false, default: 0
    end
  end
end
