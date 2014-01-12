class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :server_name_code
      t.float :duration_seconds
      t.integer :player_count
      t.integer :win_team_players
      t.integer :lose_team_players
      t.string :map_name

      t.timestamps
    end
  end
end
