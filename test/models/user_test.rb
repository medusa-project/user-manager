require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'to_s returns the username' do
    assert_equal 'bert', users(:bert).to_s
  end

  test 'username cannot be nil' do
    user = User.new
    user.username = nil
    assert_raises ActiveRecord::RecordInvalid do
      user.save!
    end
  end

  test 'username cannot be blank' do
    user = User.new
    user.username = ''
    assert_raises ActiveRecord::RecordInvalid do
      user.save!
    end
  end

end
