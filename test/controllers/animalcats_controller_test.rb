require 'test_helper'

class AnimalcatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animalcat = animalcats(:one)
  end

  test "should get index" do
    get animalcats_url
    assert_response :success
  end

  test "should get new" do
    get new_animalcat_url
    assert_response :success
  end

  test "should create animalcat" do
    assert_difference('Animalcat.count') do
      post animalcats_url, params: { animalcat: { active: @animalcat.active, name: @animalcat.name, video: @animalcat.video } }
    end

    assert_redirected_to animalcat_url(Animalcat.last)
  end

  test "should show animalcat" do
    get animalcat_url(@animalcat)
    assert_response :success
  end

  test "should get edit" do
    get edit_animalcat_url(@animalcat)
    assert_response :success
  end

  test "should update animalcat" do
    patch animalcat_url(@animalcat), params: { animalcat: { active: @animalcat.active, name: @animalcat.name, video: @animalcat.video } }
    assert_redirected_to animalcat_url(@animalcat)
  end

  test "should destroy animalcat" do
    assert_difference('Animalcat.count', -1) do
      delete animalcat_url(@animalcat)
    end

    assert_redirected_to animalcats_url
  end
end
