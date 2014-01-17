class HomeController < ApplicationController
  def index
    @players = toprounds(20)
  end

  def toprounds (limit)
    @players = User.where("total_rounds >= ?", limit).sort_by(&:winning_round_ratio).reverse
  end
end
