class EditGameDate < ActiveRecord::Migration
  def change
  	change_column :tournaments, :gameDate, :datetime, :null => false, :default => Time.now + 1.day
  end
end
