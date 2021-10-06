class MoviesController < ApplicationController
  def index
    @users = User.all
  end
end
