class UserInfo < ActiveRecord::Base
  validates :name, :department, :contact, :user_id, presence: true
  belongs_to :user
end
