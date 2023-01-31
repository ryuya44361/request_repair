class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|

      t.timestamps
      t.integer :completion_id, null: false
      t.integer :evaluation, null: false
      t.text :comment
    end
  end
end
