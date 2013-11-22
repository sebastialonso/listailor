class AddListCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :lists_owned, :integer
  end
end
