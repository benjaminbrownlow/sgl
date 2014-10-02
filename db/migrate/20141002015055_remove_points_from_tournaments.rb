class RemovePointsFromTournaments < ActiveRecord::Migration
  def change
  	remove_column :tournaments, :point
  end
end
