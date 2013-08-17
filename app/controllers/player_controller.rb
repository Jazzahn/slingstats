class PlayerController < ApplicationController

  respond_to :html, :json

  def show
    @player = PlayerStat.find(params[:id])
    @headername = @player.name + " Stats"
    respond_with @player
  end
end
