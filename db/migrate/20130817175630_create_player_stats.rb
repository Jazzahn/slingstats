class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
      t.string :name
      t.integer :rounds
      t.integer :roundswon
      t.integer :matches
      t.integer :matcheswon
      t.integer :goals
      t.integer :shootgoals
      t.integer :assists
      t.integer :throws
      t.integer :passes
      t.integer :turnovers
      t.integer :tackles
      t.integer :tacklesagst
      t.integer :selfpass

      t.timestamps
    end
  end
end
