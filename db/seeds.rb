# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

def seedusers (filename)
  CSV.foreach(filename, {:headers => true}) do |row|
    user = Users.new({:id => row[0], :username => row[1], :created_at => row[2]})
    if row[3] != "NULL"
      user.alias = row[3]
    end
    user.save
  end
end

def seedrounds (filename)
  CSV.foreach(filename, {:headers => true}) do |row|
    round = Rounds.new({:id => row[0],
                        :created_at => row[1],
                        :server_name_code => row[2],
                        :duration_seconds => row[3],
                        :player_count => row[4],
                        :win_team_players => row[5],
                        :lose_team_players => row[6],
                        :map_name => row[7]})
    round.save
  end
end

def seedroundusers (filename)
  CSV.foreach(filename, {:headers => true}) do |row|
    rounduser = RoundUsers.new({:id => row[0],
                                :user_id => row[1],
                                :round_id => row[2],
                                :win => row[3],
                                :assist => row[4],
                                :goal => row[5]})
    rounduser.save
  end
end

seedusers("./stats/users.csv")
seedrounds("./stats/rounds.csv")
seedroundusers("./stats/roundUsers.csv")
