class DropColumnHireDateInEmployees < ActiveRecord::Migration[8.1]
  def change
    remove_column :employees, :hire_date, :date
  end
end
