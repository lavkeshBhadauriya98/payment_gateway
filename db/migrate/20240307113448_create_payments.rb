class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :payment_id
      t.string :order_id
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
