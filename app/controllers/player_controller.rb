class PlayerController < ApplicationController

  respond_to :html, :json

  def show
    @player = PlayerStat.find(:first, :conditions => [ 'lower(name) = ?', params[:name].downcase])
    respond_with @player
  end
end
