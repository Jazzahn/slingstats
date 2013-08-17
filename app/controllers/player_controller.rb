class PlayerController < ApplicationController

  respond_to :html, :json

  def show
    if(params[:id]) 
      @player=PlayerStat.find_by_id(params[:id])
    else
      redirect_to :status => 404
    end
    if @player.matches > 0
      @mratio = ((@player.matcheswon.to_f / @player.matches.to_f) * 100).to_i
    else
      @mratio = 0
    end
    @headername = @player.name + " Stats"
    respond_with @player
  end
end
