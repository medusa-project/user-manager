class User < ApplicationRecord

  has_and_belongs_to_many :roles

  validates_length_of :username, minimum: 2, maximum: 255, allow_blank: false

  ##
  # Convenience method for checking whether the user belongs to the admin role.
  #
  def admin?
    self.roles.where(key: 'admin').count > 0
  end

  def to_param
    username
  end

  def to_s
    username
  end

end
