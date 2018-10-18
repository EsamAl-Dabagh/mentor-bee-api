class Mentor < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  validates_presence_of :bio, :skill, :user_id
end
