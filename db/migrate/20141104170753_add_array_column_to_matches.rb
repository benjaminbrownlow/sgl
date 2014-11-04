class AddArrayColumnToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :player_tags, :string, array: true, default: '{}'
  	remove_column :matches, :brackets_id
  	remove_column :matches, :player_one
  	remove_column :matches, :player_two
  end
end
