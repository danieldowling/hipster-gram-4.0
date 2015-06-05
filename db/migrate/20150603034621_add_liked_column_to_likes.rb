class AddLikedColumnToLikes < ActiveRecord::Migration
  def change
  	add_column :likes, :liked, :integer
  end
end
