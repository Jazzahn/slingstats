class UserSearchController < ApplicationController
  respond_to :html, :json

  def search
    @results = User.search(params[:query])
    redirect_to user_path(@results[0].username) if @results.count == 1
    @results
  end
end
