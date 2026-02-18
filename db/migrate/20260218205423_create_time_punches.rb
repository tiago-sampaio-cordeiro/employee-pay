class CreateTimePunches < ActiveRecord::Migration[8.1]
  def change
    create_table :time_punches do |t|
      t.references :employee, null: false, foreign_key: true
      t.datetime :punched_at, null: false
      t.integer :kind, null: false
      t.timestamps
    end
    add_index :time_punches, [ :employee_id, :punched_at ]
  end
end
