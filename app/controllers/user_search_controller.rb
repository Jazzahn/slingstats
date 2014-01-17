class UserSearchController < ApplicationController
  respond_to :html, :json

  def search
    @results = User.search(params[:query])
  end
end
