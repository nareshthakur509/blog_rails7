require "test_helper"

class SubscriptionplansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriptionplan = subscriptionplans(:one)
  end

  test "should get index" do
    get subscriptionplans_url
    assert_response :success
  end

  test "should get new" do
    get new_subscriptionplan_url
    assert_response :success
  end

  test "should create subscriptionplan" do
    assert_difference("Subscriptionplan.count") do
      post subscriptionplans_url, params: { subscriptionplan: { name: @subscriptionplan.name, price: @subscriptionplan.price } }
    end

    assert_redirected_to subscriptionplan_url(Subscriptionplan.last)
  end

  test "should show subscriptionplan" do
    get subscriptionplan_url(@subscriptionplan)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscriptionplan_url(@subscriptionplan)
    assert_response :success
  end

  test "should update subscriptionplan" do
    patch subscriptionplan_url(@subscriptionplan), params: { subscriptionplan: { name: @subscriptionplan.name, price: @subscriptionplan.price } }
    assert_redirected_to subscriptionplan_url(@subscriptionplan)
  end

  test "should destroy subscriptionplan" do
    assert_difference("Subscriptionplan.count", -1) do
      delete subscriptionplan_url(@subscriptionplan)
    end

    assert_redirected_to subscriptionplans_url
  end
end
