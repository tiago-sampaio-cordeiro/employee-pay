class SimplifyEmployees < ActiveRecord::Migration[8.1]
  def change
    remove_column :employees, :employment_type, :integer
    remove_column :employees, :base_salary, :integer
  end
end
