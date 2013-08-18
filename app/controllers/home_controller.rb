class HomeController < ApplicationController
  def index
    @players = PlayerStat.where("matches >= 20").sort_by(&:winning_ratio).reverse
  end
end
