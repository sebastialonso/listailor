class AddYidFieldToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :yid, :string
  end
end
