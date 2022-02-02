class AddUserIdToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :user_id, :integer
  end
end
