class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentorships

  validates_uniqueness_of :user_id
  validates_presence_of :bio, :skill, :user_id
end
