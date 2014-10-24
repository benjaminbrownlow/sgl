class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :player_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
