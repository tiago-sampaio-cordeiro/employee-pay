class DropPayrollAndPayrollAdjustment < ActiveRecord::Migration[8.1]
  def change
    drop_table :payroll_adjustments, force: :cascade
    drop_table :payrolls, force: :cascade
  end
end
