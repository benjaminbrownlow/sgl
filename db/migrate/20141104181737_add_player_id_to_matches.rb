class AddPlayerIdToMatches < ActiveRecord::Migration
  def change
  	remove_column :matches, :player_tags
  	add_column :matches, :player_ids, :integer, array: true, length: 2, default: []
  end
end
