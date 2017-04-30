require 'test_helper'

class TournamentteamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournamentteam = tournamentteams(:one)
  end

  test "should get index" do
    get tournamentteams_url
    assert_response :success
  end

  test "should get new" do
    get new_tournamentteam_url
    assert_response :success
  end

  test "should create tournamentteam" do
    assert_difference('Tournamentteam.count') do
      post tournamentteams_url, params: { tournamentteam: {  } }
    end

    assert_redirected_to tournamentteam_url(Tournamentteam.last)
  end

  test "should show tournamentteam" do
    get tournamentteam_url(@tournamentteam)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournamentteam_url(@tournamentteam)
    assert_response :success
  end

  test "should update tournamentteam" do
    patch tournamentteam_url(@tournamentteam), params: { tournamentteam: {  } }
    assert_redirected_to tournamentteam_url(@tournamentteam)
  end

  test "should destroy tournamentteam" do
    assert_difference('Tournamentteam.count', -1) do
      delete tournamentteam_url(@tournamentteam)
    end

    assert_redirected_to tournamentteams_url
  end
end
