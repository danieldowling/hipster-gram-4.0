class RemoveLikedFromLikes < ActiveRecord::Migration
  def change
  	remove_column :likes, :liked?, :string
  end
end
