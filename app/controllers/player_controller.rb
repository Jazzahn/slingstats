class PlayerController < ApplicationController

  respond_to :html, :json

  def show
    @player = Users.where("lower(alias) = ?", params[:name].downcase).first
    @player ||= Users.where("lower(username) = ?", params[:name].downcase).first



    @stats = {:name => @player.username}
    @stats[:rounds] = @player.total_rounds
    @stats[:wins] = @player.rounds_won
    @stats[:goals] = @player.goals
    @stats[:assists] = @player.assists
    @stats[:roundwinpercent] = ((@player.rounds_won / @player.total_rounds.to_f) * 100.0).round
    @stats[:goalsperround] = (@player.goals / @player.total_rounds.to_f).round(2)
    @stats[:assistsperround] = (@player.assists / @player.total_rounds.to_f).round(2)
    respond_with @stats
  end
end
