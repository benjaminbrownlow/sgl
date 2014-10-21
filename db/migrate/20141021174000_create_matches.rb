class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :brackets
      t.integer :match_number
      t.string :playerOne
      t.string :playerTwo
      t.timestamps
    end
  end
end
