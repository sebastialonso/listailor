class AddEmbedHtml5ToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :embed_html5, :string
  end
end
