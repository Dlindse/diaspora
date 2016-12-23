require 'test_helper'

class InfluencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @influence = influences(:one)
  end

  test "should get index" do
    get influences_url
    assert_response :success
  end

  test "should get new" do
    get new_influence_url
    assert_response :success
  end

  test "should create influence" do
    assert_difference('Influence.count') do
      post influences_url, params: { influence: { author: @influence.author, circa: @influence.circa, period: @influence.period, title: @influence.title } }
    end

    assert_redirected_to influence_url(Influence.last)
  end

  test "should show influence" do
    get influence_url(@influence)
    assert_response :success
  end

  test "should get edit" do
    get edit_influence_url(@influence)
    assert_response :success
  end

  test "should update influence" do
    patch influence_url(@influence), params: { influence: { author: @influence.author, circa: @influence.circa, period: @influence.period, title: @influence.title } }
    assert_redirected_to influence_url(@influence)
  end

  test "should destroy influence" do
    assert_difference('Influence.count', -1) do
      delete influence_url(@influence)
    end

    assert_redirected_to influences_url
  end
end
