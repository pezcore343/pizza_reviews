require "rails_helper"

feature "User creates a review" do
  it "fills out a form with valid information" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)
    click_on "Add a Review"

    fill_in "Title", with: "Pepperoni"
    fill_in "Body", with: "#{'x' * 50}"
    select 5, from: "Rating"
    attach_file("Photo", "spec/fixtures/images/pizza_slice.jpeg")
    click_on "Create Review"

    expect(page).to have_content "Pepperoni"
    expect(page).to have_content "★★★★★"
    expect(page).to have_content "#{'x' * 50}"
    expect(page).to have_selector("img[alt=\"Pepperoni\"]")
  end

  it "submits a blank form" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)
    click_on "Add a Review"
    click_on "Create Review"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Rating can't be blank"
  end

  it "attempts to create a review without signing in" do
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)
    click_on "Add a Review"

    expect(page).to have_content "You need to sign in or sign up"
  end
end
