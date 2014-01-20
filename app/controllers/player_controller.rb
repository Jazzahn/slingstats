class PlayerController < ApplicationController

  respond_to :html, :json

  def show
    @player = User.where("lower(alias) = ?", params[:name].downcase).first
    @player ||= User.where("lower(username) = ?", params[:name].downcase).first

    @lastrounds = RoundUser.where("user_id = ?", @player.id).order(round_id: :desc).limit(20)


    @stats = {}

    @stats[:stats] = {
      :name => @player.username,
      :rounds => @player.total_rounds,
      :wins => @player.rounds_won,
      :goals => @player.goals,
      :assists => @player.assists,
      :roundwinpercent => ((@player.rounds_won / @player.total_rounds.to_f) * 100.0).round,
      :goalsperround => (@player.goals / @player.total_rounds.to_f).round(2),
      :assistsperround => (@player.assists / @player.total_rounds.to_f).round(2)
    }

    @stats[:rounds] = []

    @lastrounds.each do |round|
      rounddata = Round.find(round.round_id)
      data = {
        :mapname => rounddata.map_name,
        :win => round.win,
        :assist => round.assist,
        :goal => round.goal,
        :duration => rounddata.duration_seconds,
        :playercount => rounddata.player_count,
        :createdat => rounddata.created_at.strftime("%s"),
        :roundid => round.round_id
      }
      @stats[:rounds] << data
    end
    respond_with @stats
  end
end
