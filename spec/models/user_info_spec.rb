require 'rails_helper'

RSpec.describe UserInfo, type: :model do
  it 'should not create blank name' do
    expect(FactoryGirl.build(:user_info, name: '')).to_not be_valid
  end
end
