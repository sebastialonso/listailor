class AddUserIdToList < ActiveRecord::Migration
  def change
    add_column :lists, :user_id, :integer
    add_column :lists, :name, :string
    add_column :lists, :description, :text
  end
end
