require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    user_login :one
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    user_login :one
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, :product_id => products(:ruby).id.to_s, :quantity => 1
    end
    assert_redirected_to store_path
  end
  
	test "should add heat" do
		assert_difference('Product.find(products(:ruby).id).heat') do
			product = Product.find(products(:ruby).id)
			product.category_ids = [categories(:one).id]
			product.save
			
			post :create, :product_id => products(:ruby).id.to_s, :quantity => 1
		end
	end

  test "should show line_item" do
    user_login :one
    get :show, :id => @line_item.to_param
    assert_response :success
  end

  test "should get edit" do
    user_login :one
    get :edit, :id => @line_item.to_param
    assert_response :success
  end

  test "should update line_item" do
    user_login :one
    put :update, :id => @line_item.to_param, :line_item => @line_item.attributes
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    user_login :one
    assert_difference('LineItem.count', -1) do
      delete :destroy, :id => @line_item.to_param
    end

    assert_redirected_to line_items_path
  end
end
