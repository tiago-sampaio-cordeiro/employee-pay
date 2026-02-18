class CreateEmployeesTable < ActiveRecord::Migration[8.1]
  def change
    create_table :employees_tables do |t|
      t.timestamps
    end
  end
end
