class UsersController < ApplicationController

  PERMITTED_PARAMS = %w(username)

  ##
  # Responds to POST /users
  #
  def create
    user = User.create!(sanitized_params)
  rescue => e
    flash['error'] = "#{e}"
    redirect_back fallback_location: new_user_path
  else
    flash['success'] = "Created user #{user}."
    redirect_to users_path
  end

  ##
  # Responds to DELETE /users/:username
  #
  def destroy
    user = User.find_by_username(params[:username])
    raise ActiveRecord::RecordNotFound unless user
    user.destroy!
  rescue => e
    flash['error'] = "#{e}"
    redirect_back fallback_location: user_path(user)
  else
    flash['success'] = "User #{user} deleted."
    redirect_to users_path
  end

  ##
  # Responds to GET /users/:username/edit
  #
  def edit
    @user = User.find_by_username(params[:username])
    raise ActiveRecord::RecordNotFound unless @user
  end

  ##
  # Responds to GET /users
  #
  def index
    @users = User.all.order(:username)
  end

  ##
  # Responds to GET /users/new
  #
  def new
    @user = User.new
  end

  ##
  # Responds to GET /users/:username
  #
  def show
    @user = User.find_by_username(params[:username])
    raise ActiveRecord::RecordNotFound unless @user
  end

  ##
  # Responds to PATCH /users/:username
  #
  def update
    user = User.find_by_username(params[:username])
    raise ActiveRecord::RecordNotFound unless user
    user.update!(sanitized_params)
  rescue => e
    flash['error'] = "#{e}"
    redirect_back fallback_location: edit_user_path(user)
  else
    flash['success'] = "Updated user #{user}."
    redirect_to users_path
  end

  private

  def sanitized_params
    params.require(:user).permit(PERMITTED_PARAMS)
  end

end
