class RemoveIsLikedColumnFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :is_liked, :string
  end
end
