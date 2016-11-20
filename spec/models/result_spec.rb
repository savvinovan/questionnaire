require 'rails_helper'

RSpec.describe Result, type: :model do
  it 'should create new Results' do
    Result.create!(department_id: 12, user_id: 1, question_id: 1, score: 4, text:'some text')
    expect(Result.last.score).to eq 4
  end
end
