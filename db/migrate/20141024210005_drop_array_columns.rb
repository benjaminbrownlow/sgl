class DropArrayColumns < ActiveRecord::Migration
  def change
  	remove_column :brackets, :player_ids
  	remove_column :matches, :player_ids
  	remove_column :players, :tournament_ids 
  	remove_column :tournaments, :player_ids

  	add_reference :players, :tournaments, index: true
  	add_reference :tournaments, :players, index: true
  end
end
