class AddFieldsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :title, :string
    add_column :videos, :duration, :integer
    add_column :videos, :uploader, :string
    add_column :videos, :rating, :float, :precision => 4, :scale => 2
    add_column :videos, :likes, :integer
    add_column :videos, :dislikes, :integer
    add_column :videos, :embeddable, :boolean
  end
end
