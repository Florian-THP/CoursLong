class AddStripeCustomerIdToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :stripe_customer_id, :string
  end
end
