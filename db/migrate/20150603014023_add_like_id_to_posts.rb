class AddLikeIdToPosts < ActiveRecord::Migration
  def change
  	add_reference :posts, :like, index: true, foreign_key: true
  end
end
