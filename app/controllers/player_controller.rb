class PlayerController < ApplicationController

  respond_to :html, :json

  def show
    @player = Users.where("lower(alias) = ?", params[:name].downcase).first
    @player ||= Users.where("lower(username) = ?", params[:name].downcase).first

    rounduser = RoundUsers.where "user_id = ?", @player.id
    win = 0
    assist = 0
    goal = 0
    totalrounds = rounduser.count

    rounduser.each do |r|
      win += r[:win] ? 1 : 0
      assist += r[:assist] ? 1 : 0
      goal += r[:goal] ? 1 : 0
    end



    @stats = {:name => @player.username}
    @stats[:rounds] = totalrounds
    @stats[:wins] = win
    @stats[:goals] = goal
    @stats[:assists] = assist
    @stats[:roundwinpercent] = ((win / totalrounds.to_f) * 100.0).round
    @stats[:goalsperround] = (goal / totalrounds.to_f).round(2)
    @stats[:assistsperround] = (assist / totalrounds.to_f).round(2)
    respond_with @stats
  end
end
