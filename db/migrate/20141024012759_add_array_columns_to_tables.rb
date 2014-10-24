class AddArrayColumnsToTables < ActiveRecord::Migration
  def change
  	remove_column :tournaments, :players_id
  	remove_column :brackets, :players_id
  	remove_column :matches, :players_id
  	add_column :tournaments, :player_ids, :integer, array: true, :default => []
  	add_column :brackets, :player_ids, :integer, array: true, :default => []
  	add_column :matches, :player_ids, :integer, array: true, :default => []
  end
end
