require 'test_helper'

class HousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house = houses(:one)
  end

  test "should get index" do
    get houses_url
    assert_response :success
  end

  test "should get new" do
    get new_house_url
    assert_response :success
  end

  test "should create house" do
    assert_difference('House.count') do
      post houses_url, params: { house: { basement: @house.basement, company_id: @house.company_id, contact_info: @house.contact_info, floor: @house.floor, location: @house.location, owner: @house.owner, pic_link: @house.pic_link, price: @house.price, realtor_id: @house.realtor_id, square_ft: @house.square_ft, style: @house.style, year_built: @house.year_built } }
    end

    assert_redirected_to house_url(House.last)
  end

  test "should show house" do
    get house_url(@house)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_url(@house)
    assert_response :success
  end

  test "should update house" do
    patch house_url(@house), params: { house: { basement: @house.basement, company_id: @house.company_id, contact_info: @house.contact_info, floor: @house.floor, location: @house.location, owner: @house.owner, pic_link: @house.pic_link, price: @house.price, realtor_id: @house.realtor_id, square_ft: @house.square_ft, style: @house.style, year_built: @house.year_built } }
    assert_redirected_to house_url(@house)
  end

  test "should destroy house" do
    assert_difference('House.count', -1) do
      delete house_url(@house)
    end

    assert_redirected_to houses_url
  end
end
