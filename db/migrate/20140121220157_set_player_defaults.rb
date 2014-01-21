class SetPlayerDefaults < ActiveRecord::Migration
  def change
    change_column_default :player_stats, :rounds, 0
    change_column_default :player_stats, :roundswon, 0
    change_column_default :player_stats, :matches, 0
    change_column_default :player_stats, :matcheswon, 0
    change_column_default :player_stats, :goals, 0
    change_column_default :player_stats, :shootgoals, 0
    change_column_default :player_stats, :assists, 0
    change_column_default :player_stats, :throws, 0
    change_column_default :player_stats, :passes, 0
    change_column_default :player_stats, :turnovers, 0
    change_column_default :player_stats, :tackles, 0
    change_column_default :player_stats, :tacklesagst, 0
    change_column_default :player_stats, :selfpass, 0
  end
end
