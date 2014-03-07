require 'test_helper'

class WorkordersControllerTest < ActionController::TestCase
  setup do
    @workorder = workorders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workorders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workorder" do
    assert_difference('Workorder.count') do
      post :create, workorder: { estimate_id: @workorder.estimate_id, invoice: @workorder.invoice, invoice_total: @workorder.invoice_total, line_item: @workorder.line_item, next_action_due: @workorder.next_action_due, notes: @workorder.notes, number: @workorder.number, po: @workorder.po, previous_action: @workorder.previous_action, price: @workorder.price, quantity: @workorder.quantity, schedule: @workorder.schedule }
    end

    assert_redirected_to workorder_path(assigns(:workorder))
  end

  test "should show workorder" do
    get :show, id: @workorder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workorder
    assert_response :success
  end

  test "should update workorder" do
    patch :update, id: @workorder, workorder: { estimate_id: @workorder.estimate_id, invoice: @workorder.invoice, invoice_total: @workorder.invoice_total, line_item: @workorder.line_item, next_action_due: @workorder.next_action_due, notes: @workorder.notes, number: @workorder.number, po: @workorder.po, previous_action: @workorder.previous_action, price: @workorder.price, quantity: @workorder.quantity, schedule: @workorder.schedule }
    assert_redirected_to workorder_path(assigns(:workorder))
  end

  test "should destroy workorder" do
    assert_difference('Workorder.count', -1) do
      delete :destroy, id: @workorder
    end

    assert_redirected_to workorders_path
  end
end
