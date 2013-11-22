class AddProviderDataToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :uid, :integer
    add_column :users, :provider, :string
  end
end
