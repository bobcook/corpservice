require 'test_helper'

class FranchisesControllerTest < ActionController::TestCase
  setup do
    @franchise = franchises(:one)
    @location = locations(:one)
    @client = clients(:one)
  end

  test "should get index" do
    get :index, client_id: @client, location_id: @location
    assert_response :success
    assert_not_nil assigns(:franchises)
  end

  test "should get new" do
    get :new,client_id: @client, location_id: @location
    assert_response :success
  end

  test "should create franchise" do
    assert_difference('Franchise.count') do
      post :create, client_id: @client, location_id: @location, franchise: { email: @franchise.email, location_id: @franchise.location_id, name: @franchise.name, number: @franchise.number, phone: @franchise.phone }
    end

    assert_redirected_to client_location_franchise_path(@client,@location,assigns(:franchise))
  end

  test "should show franchise" do
    get :show, id: @franchise,client_id: @client, location_id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @franchise,client_id: @client, location_id: @location
    assert_response :success
  end

  test "should update franchise" do
    patch :update, id: @franchise,client_id: @client, location_id: @location, franchise: { email: @franchise.email, location_id: @franchise.location_id, name: @franchise.name, number: @franchise.number, phone: @franchise.phone }
    assert_redirected_to client_location_franchise_path(@client,@location,assigns(:franchise))
  end

  test "should destroy franchise" do
    assert_difference('Franchise.count', -1) do
      delete :destroy, id: @franchise,client_id: @client, location_id: @location
    end

    assert_redirected_to client_location_franchises_path(@client, @location)
  end
end
