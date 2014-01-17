class UserSearchController < ApplicationController
  respond_to :html, :json

  def search
    @results = Users.search(params[:query])
  end
end
