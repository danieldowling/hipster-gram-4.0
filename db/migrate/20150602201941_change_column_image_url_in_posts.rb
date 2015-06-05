class ChangeColumnImageUrlInPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :image_url, :string, :default => "http://images.clipartpanda.com/hipster-glasses-drawing-moustache1.gif"
  end
end
