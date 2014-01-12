class AddStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_rounds, :integer
    add_column :users, :rounds_won, :integer
    add_column :users, :goals, :integer
    add_column :users, :assists, :integer
  end
end
