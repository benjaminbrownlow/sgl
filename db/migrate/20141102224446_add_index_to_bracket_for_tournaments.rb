class AddIndexToBracketForTournaments < ActiveRecord::Migration
  def change
  	add_index :brackets, :tournament_id
  	add_index	:activities, :tournament_id
  end
end
