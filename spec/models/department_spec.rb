require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'has name' do
    Department.create!(name: 'This is test')
    expect(Department.last.name).to eq 'This is test'
  end
end
