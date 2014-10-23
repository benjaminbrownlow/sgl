class DropPlayerNamesFromMatches < ActiveRecord::Migration
  def change
  	remove_column :matches, :playerOne
  	remove_column :matches, :playerTwo
  	add_reference :matches, :players, index: true
  end
end
