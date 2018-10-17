class Mentee < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :bio, :interests
end
