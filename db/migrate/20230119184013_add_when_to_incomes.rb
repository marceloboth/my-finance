class AddWhenToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :received_at, :datetime
  end
end
