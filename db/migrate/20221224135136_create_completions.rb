class CreateCompletions < ActiveRecord::Migration[6.1]
  def change
    create_table :completions do |t|

      t.timestamps
      t.integer :reservation_id, null: false
      t.text :substance, null: false
    end
  end
end
