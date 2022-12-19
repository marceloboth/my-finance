class CreateIncomeReadModel < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.decimal :value
      t.string :description

      t.timestamps
    end
  end
end
