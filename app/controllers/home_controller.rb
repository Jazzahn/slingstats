class HomeController < ApplicationController  
  def index
    @headername = "Top Players"
    @topplayers = Array.new
    @players = PlayerStat.where("matches >= 20")
    @players.each do |p|
      @topplayers.push({
        :id => p.id,
        :name => p.name, 
        :matches => p.matches,
        :matcheswon => p.matcheswon, 
        :mratio => ((p.matcheswon.to_f / p.matches.to_f) * 100).to_i
      })
    end
    @topplayers.sort_by!{|p| -p[:mratio] }
  end
end
