require 'rails_helper'

RSpec.describe Result, type: :model do
  let(:res) {FactoryGirl.build(:result)}
  let(:res_text_blank) {FactoryGirl.build(:result, text: '')}
  it 'should create new results with valid data' do
    expect(res).to be_valid
  end
  it 'should not create with blank text' do
    expect(res_text_blank).to_not be_valid
  end
end
