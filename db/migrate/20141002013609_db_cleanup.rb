class DbCleanup < ActiveRecord::Migration
  def self.up
  	# Players Tables
  	add_column :players, :totalGames, :integer, :null => false, :default => 0
  	add_column :players, :totalWins, :integer, :null => false, :default => 0

  	# Tournaments Tables
  	rename_column :tournaments, :game, :title
  	add_column :tournaments, :totalPlayers, :integer, :null => false, :default => 0
  	add_column :tournaments, :totalMatches, :integer, :null => false, :default => 0

  end

  def self.down
  	# Players Tables
  	remove_column :players, :totalGames, :integer, :null => false, :default => 0
  	remove_column :players, :totalWins, :integer, :null => false, :default => 0

  	# Tournaments Tables
  	rename_column :tournaments, :title, :game
  	remove_column :tournaments, :totalPlayers, :integer, :null => false, :default => 0
  	remove_column :tournaments, :totalMatches, :integer, :null => false, :default => 0
  end
end
