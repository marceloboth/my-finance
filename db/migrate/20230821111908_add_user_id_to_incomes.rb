class AddUserIdToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :user_id, :bigint
  end
end
