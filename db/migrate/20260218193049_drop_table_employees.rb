class DropTableEmployees < ActiveRecord::Migration[8.1]
  def change
    drop_table :employees
  end
end
