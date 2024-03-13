class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :order_id
      t.integer :total_amount
      t.string :status
      t.string :currency
      t.string :receipt

      t.timestamps
    end
  end
end
