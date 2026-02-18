class RenameEmployeesTableToEmployees < ActiveRecord::Migration[8.1]
  def change
    rename_table :employees_tables, :employees
  end
end
