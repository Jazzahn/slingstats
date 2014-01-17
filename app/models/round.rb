class Round < ActiveRecord::Base
  has_many :round_users
  has_many :users, :through => :round_users

  scope :onevone, -> { where(:player_count => 2) }
  scope :twovtwo, -> { where(:win_team_players => 2, :lose_team_players => 2) }
  scope :threevthree, -> { where(:win_team_players => 3, :lose_team_players => 3) }
end
