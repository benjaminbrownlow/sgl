class EditBracketsIdColumn < ActiveRecord::Migration
  def change
  	rename_column :matches, :brackets_id, :bracket_id
  end
end
