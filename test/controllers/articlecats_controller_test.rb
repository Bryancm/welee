require 'test_helper'

class ArticlecatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @articlecat = articlecats(:one)
  end

  test "should get index" do
    get articlecats_url
    assert_response :success
  end

  test "should get new" do
    get new_articlecat_url
    assert_response :success
  end

  test "should create articlecat" do
    assert_difference('Articlecat.count') do
      post articlecats_url, params: { articlecat: { active: @articlecat.active, name: @articlecat.name, video: @articlecat.video } }
    end

    assert_redirected_to articlecat_url(Articlecat.last)
  end

  test "should show articlecat" do
    get articlecat_url(@articlecat)
    assert_response :success
  end

  test "should get edit" do
    get edit_articlecat_url(@articlecat)
    assert_response :success
  end

  test "should update articlecat" do
    patch articlecat_url(@articlecat), params: { articlecat: { active: @articlecat.active, name: @articlecat.name, video: @articlecat.video } }
    assert_redirected_to articlecat_url(@articlecat)
  end

  test "should destroy articlecat" do
    assert_difference('Articlecat.count', -1) do
      delete articlecat_url(@articlecat)
    end

    assert_redirected_to articlecats_url
  end
end
