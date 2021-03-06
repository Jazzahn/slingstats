class RoundStatsController < ApplicationController

  respond_to :html, :json

  def show
    round = Round.find(params[:id])
    roundusers = RoundUser.where(round_id: round.id)

    @data = {
      :goal => nil,
      :assists => [],
      :winners => [],
      :losers => [],
      :mapname => round.map_name,
      :roundid => round.id
    }

    roundusers.each do |user|
      u = User.find(user.user_id)
      if user.win
        @data[:winners] << u.username
      else
        @data[:losers] << u.username
      end
      if user.goal
        @data[:goal] = u.username
      end
      if user.assist
        @data[:assists] << u.username
      end
    end
    respond_with @data
  end
end
