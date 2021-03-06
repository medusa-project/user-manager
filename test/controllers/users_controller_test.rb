require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  # create()

  test 'create is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    post '/users', {}
    assert_redirected_to root_path
  end

  test 'create creates a user' do
    sign_in_as(users(:admin))
    post '/users', {
        params: {
            user: {
                username: 'newuser'
            }
        }
    }
    assert_not_nil User.find_by_username('newuser')
  end

  # destroy()

  test 'destroy is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    delete '/users/user', {}
    assert_redirected_to root_path
  end

  test 'destroy destroys a user' do
    sign_in_as(users(:admin))
    delete '/users/user'
    assert_nil User.find_by_username('user')
  end

  # edit()

  test 'edit is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/users/admin/edit'
    assert_response :ok
  end

  test 'edit is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/users/admin/edit'
    assert_redirected_to root_path
  end

  # index()

  test 'index is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/users'
    assert_response :ok
  end

  test 'index is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/users'
    assert_redirected_to root_path
  end

  # new()

  test 'new is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/users/new'
    assert_response :ok
  end

  test 'new is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/users/new'
    assert_redirected_to root_path
  end

  # show()

  test 'show is accessible to admin users' do
    sign_in_as(users(:admin))
    get '/users/admin'
    assert_response :ok
  end

  test 'show is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    get '/users/admin'
    assert_redirected_to root_path
  end

  # update()

  test 'update is inaccessible to non-admin users' do
    sign_in_as(users(:user))
    patch '/users/user', {}
    assert_redirected_to root_path
  end

  test 'update updates a user' do
    sign_in_as(users(:admin))
    user = users(:user)

    patch "/users/#{user.username}", {
        params: {
            user: {
                username: 'newusername'
            }
        }
    }

    user.reload
    assert_equal 'newusername', user.username
  end

end
