class AddTournamentReferenceToPlayers < ActiveRecord::Migration
  def change
  	add_reference :players, :tournaments, index: true
  end
end
