class RemoveLikedTypeFromLikes < ActiveRecord::Migration
  def change
  	remove_column :likes, :liked_type, :string
  end
end
