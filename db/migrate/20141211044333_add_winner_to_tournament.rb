class AddWinnerToTournament < ActiveRecord::Migration
  def change
    add_column :tournaments, :winner, :string
  end
end
