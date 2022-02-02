class ChangeSusbcribedToSubscribed < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :susbcribed, :subscribed
  end
end
