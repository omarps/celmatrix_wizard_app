require 'rails_helper'

RSpec.describe "the user creates a new user" do
  it "creates the user" do
    visit "/"
    click_link "New User"
    
    # Step 1
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "Test"
    click_button "Next"
    
    # Step 2
    fill_in "Email address", with: "test@test.com"
    click_button "Next"
    
    # Step 3
    select("18 - 25", from: "Age")
    fill_in "Height feets", with: "12"
    fill_in "Height inches", with: "24"
    fill_in "Weight", with: "36"
    click_button "Next"
    
    # Step 4
    # fill_in "Favorite color", with: "Yellow"
    first("input#favorite_color", visible: false).set("Yellow")
    click_button "Next"
    
    # Step 5
    click_button "OK"
    
    expect(page).to have_content("User succesfully created!")
  end
end