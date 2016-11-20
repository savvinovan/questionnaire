require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'should create new Quesiton' do
    Question.create!(name: '123123', text: 'asdfasdf asdfasdf')

    expect(Question.last.name).to eq('123123')
    expect(Question.last.text).to eq('asdfasdf asdfasdf')
  end
end
