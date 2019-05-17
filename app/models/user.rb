class User < ApplicationRecord

  has_and_belongs_to_many :roles

  validates_length_of :username, minimum: 2, maximum: 255, allow_blank: false

  def to_param
    username
  end

  def to_s
    username
  end

end
