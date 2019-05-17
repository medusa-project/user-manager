require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest

 # create()

  test 'create is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    post '/roles', {}
    assert_redirected_to root_path
  end

  test 'create creates a role' do
    sign_in_as(users(:admin))
    post '/roles', {
        params: {
            role: {
                key: 'newrole',
                name: 'New Role'
            }
        }
    }
    assert_not_nil Role.find_by_key('newrole')
  end

  # destroy()

  test 'destroy is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    delete '/roles/admin', {}
    assert_redirected_to root_path
  end

  test 'destroy destroys a role' do
    sign_in_as(users(:admin))
    delete '/roles/admin'
    assert_nil Role.find_by_key('admin')
  end

  # edit()

  test 'edit is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/roles/admin/edit'
    assert_response :ok
  end

  test 'edit is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/roles/admin/edit'
    assert_redirected_to root_path
  end

  # index()

  test 'index is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/roles'
    assert_response :ok
  end

  test 'index is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/roles'
    assert_redirected_to root_path
  end

  # new()

  test 'new is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/roles/new'
    assert_response :ok
  end

  test 'new is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/roles/new'
    assert_redirected_to root_path
  end

  # show()

  test 'show is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/roles/admin'
    assert_response :ok
  end

  test 'show is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/roles/admin'
    assert_redirected_to root_path
  end

  # update()

  test 'update is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    patch '/roles/admin', {}
    assert_redirected_to root_path
  end

  test 'update updates a role' do
    sign_in_as(users(:admin))
    role = roles(:user)

    patch "/roles/#{role.key}", {
        params: {
            role: {
                key: 'newkey',
                name: 'New Name'
            }
        }
    }
    role.reload
    assert_equal 'newkey', role.key
  end

end