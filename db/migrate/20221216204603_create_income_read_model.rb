class CreateIncomeReadModel < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes, id: :uuid do |t|
      t.decimal :value, null: false
      t.string :description, null: false
      t.datetime :received_at, null: false

      t.timestamps
    end
  end
end
