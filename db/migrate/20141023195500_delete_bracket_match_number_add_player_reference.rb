class DeleteBracketMatchNumberAddPlayerReference < ActiveRecord::Migration
  def change
  	remove_column :brackets, :bracket_number
  	remove_column :matches, :match_number
  	add_reference :brackets, :players, index: true
  	add_reference :tournaments, :players, index: true
  end
end
