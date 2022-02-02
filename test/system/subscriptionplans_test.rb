require "application_system_test_case"

class SubscriptionplansTest < ApplicationSystemTestCase
  setup do
    @subscriptionplan = subscriptionplans(:one)
  end

  test "visiting the index" do
    visit subscriptionplans_url
    assert_selector "h1", text: "Subscriptionplans"
  end

  test "should create subscriptionplan" do
    visit subscriptionplans_url
    click_on "New subscriptionplan"

    fill_in "Name", with: @subscriptionplan.name
    fill_in "Price", with: @subscriptionplan.price
    click_on "Create Subscriptionplan"

    assert_text "Subscriptionplan was successfully created"
    click_on "Back"
  end

  test "should update Subscriptionplan" do
    visit subscriptionplan_url(@subscriptionplan)
    click_on "Edit this subscriptionplan", match: :first

    fill_in "Name", with: @subscriptionplan.name
    fill_in "Price", with: @subscriptionplan.price
    click_on "Update Subscriptionplan"

    assert_text "Subscriptionplan was successfully updated"
    click_on "Back"
  end

  test "should destroy Subscriptionplan" do
    visit subscriptionplan_url(@subscriptionplan)
    click_on "Destroy this subscriptionplan", match: :first

    assert_text "Subscriptionplan was successfully destroyed"
  end
end
