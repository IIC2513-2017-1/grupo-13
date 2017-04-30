require 'test_helper'

class TeamplayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teamplayer = teamplayers(:one)
  end

  test "should get index" do
    get teamplayers_url
    assert_response :success
  end

  test "should get new" do
    get new_teamplayer_url
    assert_response :success
  end

  test "should create teamplayer" do
    assert_difference('Teamplayer.count') do
      post teamplayers_url, params: { teamplayer: {  } }
    end

    assert_redirected_to teamplayer_url(Teamplayer.last)
  end

  test "should show teamplayer" do
    get teamplayer_url(@teamplayer)
    assert_response :success
  end

  test "should get edit" do
    get edit_teamplayer_url(@teamplayer)
    assert_response :success
  end

  test "should update teamplayer" do
    patch teamplayer_url(@teamplayer), params: { teamplayer: {  } }
    assert_redirected_to teamplayer_url(@teamplayer)
  end

  test "should destroy teamplayer" do
    assert_difference('Teamplayer.count', -1) do
      delete teamplayer_url(@teamplayer)
    end

    assert_redirected_to teamplayers_url
  end
end
