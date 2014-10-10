class SetTournamentTimeDefaultToNow < ActiveRecord::Migration
  def change
  	change_column :tournaments, :signUpDate, :datetime, :null => false, :default => Time.now
  	change_column :tournaments, :gameDate, :datetime, :null => false, :default => Time.now
  end
end
