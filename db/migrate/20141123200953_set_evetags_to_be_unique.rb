class SetEvetagsToBeUnique < ActiveRecord::Migration
  def change
  	 add_index :players, :evetag, unique: true
  end
end
