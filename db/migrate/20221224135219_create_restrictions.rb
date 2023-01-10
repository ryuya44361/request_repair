class CreateRestrictions < ActiveRecord::Migration[6.1]
  def change
    create_table :restrictions do |t|

      t.timestamps
      t.integer :default_limit_id, null: false
      t.date :reservation_day, null: false
      t.integer :headcount, null: false
    end
  end
end
