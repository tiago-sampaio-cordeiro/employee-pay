class CreatePayrollAdjustments < ActiveRecord::Migration[8.1]
  def change
    create_table :payroll_adjustments do |t|
      t.references :payroll, null: false, foreign_key: true

      t.string :description, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.integer :kind, null: false
      t.timestamps
    end
    add_index :payroll_adjustments, :kind
  end
end
