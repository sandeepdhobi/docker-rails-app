require "application_system_test_case"

class RelativesTest < ApplicationSystemTestCase
  setup do
    @relative = relatives(:one)
  end

  test "visiting the index" do
    visit relatives_url
    assert_selector "h1", text: "Relatives"
  end

  test "creating a Relative" do
    visit relatives_url
    click_on "New Relative"

    fill_in "Name", with: @relative.name
    fill_in "Relation", with: @relative.relation
    click_on "Create Relative"

    assert_text "Relative was successfully created"
    click_on "Back"
  end

  test "updating a Relative" do
    visit relatives_url
    click_on "Edit", match: :first

    fill_in "Name", with: @relative.name
    fill_in "Relation", with: @relative.relation
    click_on "Update Relative"

    assert_text "Relative was successfully updated"
    click_on "Back"
  end

  test "destroying a Relative" do
    visit relatives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relative was successfully destroyed"
  end
end
