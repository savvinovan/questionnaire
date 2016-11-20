require "rails_helper"

RSpec.feature "test page", :type => :feature do
  include Warden::Test::Helpers
  scenario "Unauthorized user cannot start test" do
    visit tests_take_path
    expect(current_path).to eq new_user_session_path
  end
  scenario "Authorized user can start test" do
    user = FactoryGirl.create(:user)

    login_as user
    visit tests_take_path
    expect(current_path).to eq tests_take_path
  end
  scenario "User Info filled and submitted" do
    user = FactoryGirl.create(:user)
    login_as user
    visit tests_intro_path
    fill_in 'user_info_name', with: Faker::Name.name_with_middle
    fill_in 'user_info_department', with: Faker::Commerce.department
    fill_in 'user_info_contact', with: Faker::Address.street_address
    click_button 'Сохранить'
  end
end
