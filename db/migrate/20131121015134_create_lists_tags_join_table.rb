class CreateListsTagsJoinTable < ActiveRecord::Migration
  def change
    create_table :lists_tags, id: false do |t|
      t.integer :list_id
      t.integer :tag_id
    end
  end
end
