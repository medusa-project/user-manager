require 'test_helper'

class RoleTest < ActiveSupport::TestCase

  test 'key cannot be nil' do
    role = Role.new
    role.key = nil
    assert_raises ActiveRecord::RecordInvalid do
      role.save!
    end
  end

  test 'key cannot be blank' do
    role = Role.new
    role.key = ''
    assert_raises ActiveRecord::RecordInvalid do
      role.save!
    end
  end

  test 'name cannot be nil' do
    role = Role.new
    role.name = nil
    assert_raises ActiveRecord::RecordInvalid do
      role.save!
    end
  end

  test 'name cannot be blank' do
    role = Role.new
    role.name = ''
    assert_raises ActiveRecord::RecordInvalid do
      role.save!
    end
  end

  test 'to_s returns the key' do
    assert_equal 'admin', roles(:admin).to_s
  end

end
