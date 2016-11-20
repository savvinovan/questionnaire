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
end
