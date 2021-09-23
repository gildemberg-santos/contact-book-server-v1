require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    get admins_url, as: :json
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post admins_url, params: { admin: { email: @admin.email, name: @admin.name, password: @admin.password } }, as: :json
    end

    assert_response 201
  end

  test "should show admin" do
    get admin_url(@admin), as: :json
    assert_response :success
  end

  test "should update admin" do
    patch admin_url(@admin), params: { admin: { email: @admin.email, name: @admin.name, password: @admin.password } }, as: :json
    assert_response 200
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete admin_url(@admin), as: :json
    end

    assert_response 204
  end
end
