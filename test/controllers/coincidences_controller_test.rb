require 'test_helper'

class CoincidencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coincidence = coincidences(:one)
  end

  test "should get index" do
    get coincidences_url
    assert_response :success
  end

  test "should get new" do
    get new_coincidence_url
    assert_response :success
  end

  test "should create coincidence" do
    assert_difference('Coincidence.count') do
      post coincidences_url, params: { coincidence: { animal_id: @coincidence.animal_id, consideration: @coincidence.consideration } }
    end

    assert_redirected_to coincidence_url(Coincidence.last)
  end

  test "should show coincidence" do
    get coincidence_url(@coincidence)
    assert_response :success
  end

  test "should get edit" do
    get edit_coincidence_url(@coincidence)
    assert_response :success
  end

  test "should update coincidence" do
    patch coincidence_url(@coincidence), params: { coincidence: { animal_id: @coincidence.animal_id, consideration: @coincidence.consideration } }
    assert_redirected_to coincidence_url(@coincidence)
  end

  test "should destroy coincidence" do
    assert_difference('Coincidence.count', -1) do
      delete coincidence_url(@coincidence)
    end

    assert_redirected_to coincidences_url
  end
end
