class User < ApplicationRecord

  validates_length_of :username, minimum: 2, maximum: 255, allow_blank: false

end
