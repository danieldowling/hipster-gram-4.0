class AddColumnLikedToLikes < ActiveRecord::Migration
  def change
  	add_column :likes, :liked?, :boolean, :default => false
  end
end
