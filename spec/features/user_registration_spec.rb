require "rails_helper"

feature "User registration in" do

  scenario "with valid credentials" do
    user = double("user", email: "abc@abc.com",password: "12345678")
    visit new_user_registration_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button I18n.t "sign_up"

    expect(page).to have_content(I18n.t "devise.registrations.signed_up")
  end

  scenario "with invalid credentials" do
    user = double("user", email: "abc@abc.com",password: "12345678")
    visit new_user_registration_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: "something"
    click_button I18n.t "sign_up"

    expect(page).not_to have_content(I18n.t "devise.registrations.signed_up")
  end
end
