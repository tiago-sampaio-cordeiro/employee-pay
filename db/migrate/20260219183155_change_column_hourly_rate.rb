class ChangeColumnHourlyRate < ActiveRecord::Migration[8.1]
  def change
    change_column_null :employees, :hourly_rate, false
  end
end
