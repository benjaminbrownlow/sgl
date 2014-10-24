class EditArrayColumnsToTables < ActiveRecord::Migration
  def change
  	add_column :tournaments, :player_ids, :integer, array: true, :default => []
  	add_column :brackets, :player_ids, :integer, array: true, :default => []
  	add_column :matches, :player_ids, :integer, array: true, :default => []
  end
end
