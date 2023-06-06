class AddNameAndIndividualIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :individual_id, :string, null: false

    add_index :users, :individual_id, unique: true
  end
end
