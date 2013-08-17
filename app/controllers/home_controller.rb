class HomeController < ApplicationController
  def index
    @headername = "Top Players"
    @players = PlayerStat.where("matches >= 20").sort_by(&:winning_ratio).reverse
  end
end
