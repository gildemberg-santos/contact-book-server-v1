require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url, as: :json
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post addresses_url, params: { address: { cep: @address.cep, city: @address.city, contact_id: @address.contact_id, district: @address.district, number: @address.number, road: @address.road, states: @address.states } }, as: :json
    end

    assert_response 201
  end

  test "should show address" do
    get address_url(@address), as: :json
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { cep: @address.cep, city: @address.city, contact_id: @address.contact_id, district: @address.district, number: @address.number, road: @address.road, states: @address.states } }, as: :json
    assert_response 200
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address), as: :json
    end

    assert_response 204
  end
end
