class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :game
      t.integer :point

      t.timestamps
    end
  end
end
