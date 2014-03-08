require 'test_helper'

class WorkordersControllerTest < ActionController::TestCase
  setup do
    @workorder = workorders(:one)
    @franchise = franchises(:one)
    @location = locations(:one)
    @client = clients(:one)
  end

  test "should get index" do
    get :index, client_id: @client, location_id: @location, franchise_id: @franchise
    assert_response :success
    assert_not_nil assigns(:workorders)
  end

  test "should get new" do
    get :new, client_id: @client, location_id: @location, franchise_id: @franchise
    assert_response :success
  end

  test "should create workorder" do
    assert_difference('Workorder.count') do
      post :create, client_id: @client, location_id: @location, franchise_id: @franchise, workorder: { estimate_id: @workorder.estimate_id, invoice: @workorder.invoice, invoice_total: @workorder.invoice_total, line_item: @workorder.line_item, next_action_due: @workorder.next_action_due, notes: @workorder.notes, number: @workorder.number, po: @workorder.po, previous_action: @workorder.previous_action, price: @workorder.price, quantity: @workorder.quantity, schedule: @workorder.schedule, location_id: @location.id, franchise_id: @franchise.id }
    end
    assert_redirected_to client_location_franchise_workorder_path(@client, @location,@franchise, assigns(:workorder))
  end

  test "should show workorder" do
    get :show, client_id: @client, location_id: @location, franchise_id: @franchise, id: @workorder
    assert_response :success
  end

  test "should get edit" do
    get :edit, client_id: @client, location_id: @location, franchise_id: @franchise, id: @workorder
    assert_response :success
  end

  test "should update workorder" do
    patch :update, client_id: @client, location_id: @location, franchise_id: @franchise, id: @workorder, workorder: { estimate_id: @workorder.estimate_id, invoice: @workorder.invoice, invoice_total: @workorder.invoice_total, line_item: @workorder.line_item, next_action_due: @workorder.next_action_due, notes: @workorder.notes, number: @workorder.number, po: @workorder.po, previous_action: @workorder.previous_action, price: @workorder.price, quantity: @workorder.quantity, schedule: @workorder.schedule, location_id: @location.id, franchise_id: @franchise.id }
    assert_redirected_to client_location_franchise_workorder_path(@client, @location,@franchise, assigns(:workorder))
  end

  test "should destroy workorder" do
    assert_difference('Workorder.count', -1) do
      delete :destroy, client_id: @client, location_id: @location, franchise_id: @franchise, id: @workorder
    end

    assert_redirected_to client_location_franchise_workorders_path(@client, @location,@franchise)
  end
end
