class Role < ApplicationRecord

  has_and_belongs_to_many :users

  validates_length_of :key, minimum: 2, maximum: 255, allow_blank: false
  validates_length_of :name, minimum: 2, maximum: 255, allow_blank: false

  def to_param
    key
  end

  def to_s
    key
  end

end
