require "rails_helper"

RSpec.feature "test page", :type => :feature do
  include Warden::Test::Helpers
  let(:user) {FactoryGirl.create(:user)}
  let(:user_with_department) {FactoryGirl.create(:user_with_department)}
  scenario "Unauthorized user cannot start test" do
    visit tests_take_path
    expect(current_path).to eq new_user_session_path
  end
  scenario "Authorized user can start test" do
    login_as user
    visit tests_take_path
    expect(current_path).to eq tests_take_path
  end
  scenario "User Info filled and submitted" do
    login_as user_with_department
    visit tests_intro_path
    fill_in 'user_info_name', with: Faker::Name.name_with_middle
    fill_in 'user_info_department', with: Faker::Commerce.department
    fill_in 'user_info_contact', with: Faker::Address.street_address
    click_button 'Сохранить'
    expect(current_path).to eq tests_take_path
    expect(page).to have_text('Сохранено')
  end
  scenario "Test filled and submitted" do
    login_as user_with_department
    visit tests_take_path
    fill_in 'result_text', with: Faker::Lorem.sentence
    click_button 'Сохранить ответ'
    expect(current_path).to eq tests_take_path
    expect(page).to_not have_text('Нужно заполнить комментарий')
  end
  scenario "Test filled with blank comment and submitted" do
    login_as user_with_department
    visit tests_take_path
    fill_in 'result_text', with: ' '
    click_button 'Сохранить ответ'
    expect(current_path).to eq tests_take_path
    expect(page).to have_text('Нужно заполнить комментарий')
  end
end
