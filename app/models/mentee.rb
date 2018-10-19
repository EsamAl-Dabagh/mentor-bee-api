class Mentee < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id
  validates_presence_of :user_id, :bio, :interest
end
