class CreateBrackets < ActiveRecord::Migration
  def change
    create_table :brackets do |t|
    	t.integer :bracket_number
    	t.references :tournament
      t.timestamps
    end
  end
end
