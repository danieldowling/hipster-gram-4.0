class AddIsLikedToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :is_liked, :integer, default: 0
  end
end
