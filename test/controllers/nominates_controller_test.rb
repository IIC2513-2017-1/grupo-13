require 'test_helper'

class NominatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nominate = nominates(:one)
  end

  test "should get index" do
    get nominates_url
    assert_response :success
  end

  test "should get new" do
    get new_nominate_url
    assert_response :success
  end

  test "should create nominate" do
    assert_difference('Nominate.count') do
      post nominates_url, params: { nominate: {  } }
    end

    assert_redirected_to nominate_url(Nominate.last)
  end

  test "should show nominate" do
    get nominate_url(@nominate)
    assert_response :success
  end

  test "should get edit" do
    get edit_nominate_url(@nominate)
    assert_response :success
  end

  test "should update nominate" do
    patch nominate_url(@nominate), params: { nominate: {  } }
    assert_redirected_to nominate_url(@nominate)
  end

  test "should destroy nominate" do
    assert_difference('Nominate.count', -1) do
      delete nominate_url(@nominate)
    end

    assert_redirected_to nominates_url
  end
end
