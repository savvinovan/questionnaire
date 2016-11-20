require "rails_helper"

RSpec.feature "admin dashboard", :type => :feature do
  include Warden::Test::Helpers
  scenario "Unauthorized user hit admin url" do
    user = FactoryGirl.build(:user)
    login_as user
    visit rails_admin_path
    expect(current_path).to eq root_path
  end
  scenario "Admin user hit admin url" do
    admin = FactoryGirl.create(:admin)

    login_as admin
    visit rails_admin_path
    expect(current_path).to eq rails_admin_path
  end
end
