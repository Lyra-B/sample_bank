class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :receiver_id
      t.integer :sender_id

      t.timestamps
    end
    add_index :transactions, :receiver_id
    add_index :transactions, :sender_id
  end
end
