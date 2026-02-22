class AddNullFalseInNameColumns < ActiveRecord::Migration[8.1]
  def change
    User.update_all(first_name: "0")
    User.update_all(last_name: "0")
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
  end
end
