class RenameTournamentIDsFromPlayers < ActiveRecord::Migration
  def change
  	remove_column :players, :tournaments_id, :tournament_id
  	add_column :players, :tournament_ids, :integer, array: true, :default => []
  end
end
