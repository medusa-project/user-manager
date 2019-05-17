class RolesController < ApplicationController

  PERMITTED_PARAMS = %w(key name)

  before_action :require_authenticated
  before_action :require_admin

  ##
  # Responds to POST /roles
  #
  def create
    role = Role.create!(sanitized_params)
  rescue => e
    flash['error'] = "#{e}"
    redirect_back fallback_location: new_role_path
  else
    flash['success'] = "Created #{role.name} role."
    redirect_to roles_path
  end

  ##
  # Responds to DELETE /roles/:key
  #
  def destroy
    role = Role.find_by_key(params[:key])
    raise ActiveRecord::RecordNotFound unless role
    role.destroy!
  rescue => e
    flash['error'] = "#{e}"
    redirect_back fallback_location: role_path(role)
  else
    flash['success'] = "Deleted #{role.name} role."
    redirect_to roles_path
  end

  ##
  # Responds to GET /roles/:key/edit
  #
  def edit
    @role = Role.find_by_key(params[:key])
    raise ActiveRecord::RecordNotFound unless @role
  end

  ##
  # Responds to GET /roles
  #
  def index
    @roles = Role.all.order(:name)
  end

  ##
  # Responds to GET /roles/new
  #
  def new
    @role = Role.new
  end

  ##
  # Responds to GET /roles/:key
  #
  def show
    @role = Role.find_by_key(params[:key])
    raise ActiveRecord::RecordNotFound unless @role
    @users = @role.users.order(:username)
  end

  ##
  # Responds to PATCH /roles/:key
  #
  def update
    role = Role.find_by_key(params[:key])
    raise ActiveRecord::RecordNotFound unless role
    role.update!(sanitized_params)
  rescue => e
    flash['error'] = "#{e}"
    redirect_back fallback_location: edit_role_path(role)
  else
    flash['success'] = "Updated #{role.name} role."
    redirect_to roles_path
  end

  private

  def sanitized_params
    params.require(:role).permit(PERMITTED_PARAMS)
  end

end
