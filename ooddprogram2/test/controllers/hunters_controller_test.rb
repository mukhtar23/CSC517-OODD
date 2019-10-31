require 'test_helper'

class HuntersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hunter = hunters(:one)
  end

  test "should get index" do
    get hunters_url
    assert_response :success
  end

  test "should get new" do
    get new_hunter_url
    assert_response :success
  end

  test "should create hunter" do
    assert_difference('Hunter.count') do
      post hunters_url, params: { hunter: { user_id: @hunter.user_id } }
    end

    assert_redirected_to hunter_url(Hunter.last)
  end

  test "should show hunter" do
    get hunter_url(@hunter)
    assert_response :success
  end

  test "should get edit" do
    get edit_hunter_url(@hunter)
    assert_response :success
  end

  test "should update hunter" do
    patch hunter_url(@hunter), params: { hunter: { user_id: @hunter.user_id } }
    assert_redirected_to hunter_url(@hunter)
  end

  test "should destroy hunter" do
    assert_difference('Hunter.count', -1) do
      delete hunter_url(@hunter)
    end

    assert_redirected_to hunters_url
  end
end
