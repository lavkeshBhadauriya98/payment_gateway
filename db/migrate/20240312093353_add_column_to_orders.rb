class AddColumnToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :amount, :integer
  end
end
