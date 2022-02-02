class AddSubscriberAndStripeIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :susbcribed, :boolean
    add_column :users, :stripeid, :string
  end
end
