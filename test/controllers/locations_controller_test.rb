require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
    @client = clients(:one)
  end

  test "should get index" do
    get :index, client_id: @client
    assert_response :success
#    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new, client_id: @client
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, client_id: @client , location: { address1: @location.address1, address2: @location.address2, city: @location.city, code: @location.code, email: @location.email, phone: @location.phone, state: @location.state, zip: @location.zip }
    end

    assert_redirected_to client_location_path(@client, assigns(:location))
  end

  test "should show location" do
    get :show, id: @location, client_id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location, client_id: @client
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, client_id: @client, location: { address1: @location.address1, address2: @location.address2, city: @location.city, code: @location.code, email: @location.email, phone: @location.phone, state: @location.state, zip: @location.zip }
    assert_redirected_to client_location_path(@client, assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location ,client_id: @client
    end

    assert_redirected_to client_locations_path(@client)
  end
end
