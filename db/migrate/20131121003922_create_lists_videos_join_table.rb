class CreateListsVideosJoinTable < ActiveRecord::Migration
  def change
    create_table :lists_videos, id: false do |t|
      t.integer :list_id
      t.integer :video_id
    end
  end
end
