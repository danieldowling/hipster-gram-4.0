class RemoveLikedIdColumnFromLikes < ActiveRecord::Migration
  def change
 	remove_column :likes, :liked_id, :string
  end
end
