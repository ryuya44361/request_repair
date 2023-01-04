class CreateDefaultLimits < ActiveRecord::Migration[6.1]
  def change
    create_table :default_limits do |t|

      t.timestamps
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.integer :headcount, null: false, default: 5

    end
  end
end
