class AddPlayerIdsToMatches < ActiveRecord::Migration
  def change
  	add_reference :matches, :brackets, index: true
  	add_column :matches, :player_one, :string
  	add_column :matches, :player_two, :string
  end
end
