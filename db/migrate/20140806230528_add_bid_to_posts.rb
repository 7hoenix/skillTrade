class AddBidToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :bid_id, :integer
    add_index :posts, :bid_id
  end
end
