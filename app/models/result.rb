class Result < ActiveRecord::Base
  validates :text, presence: true
end
