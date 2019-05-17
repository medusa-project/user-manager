require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'admin? returns true for administrators' do
    assert users(:admin).admin?
  end

  test 'admin? returns false for non-administrators' do
    assert !users(:user).admin?
  end

  test 'to_s returns the username' do
    assert_equal 'admin', users(:admin).to_s
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
