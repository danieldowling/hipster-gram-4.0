class AddHipsterIndexToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :hipster_index, :integer, :default => 0
  end
end
