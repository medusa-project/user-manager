class UsersController < ApplicationController

  ##
  # Responds to GET /users
  #
  def index
    @users = User.all.order(:username)
  end

  ##
  # Responds to GET /users/:username
  #
  def show
    @user = User.find_by_username(params[:username])
    raise ActiveRecord::RecordNotFound unless @user
  end

end
