class RenameBracketsIdToBracket < ActiveRecord::Migration
  def change
  	rename_column :activities , :brackets_id, :bracket_id
  end
end
