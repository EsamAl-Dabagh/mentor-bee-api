class Mentor < ApplicationRecord
  belongs_to :user
  validates_presence_of :bio, :skills, :user_id
end
