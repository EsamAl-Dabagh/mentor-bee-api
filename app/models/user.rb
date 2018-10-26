class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  has_one :mentee
  has_one :mentor
  before_create :attach_avatar

  def attach_avatar
    file_path = Dir.glob(Rails.root.join("public/video_seed/*")).sample
    self.pic = File.basename(file_path)
  end
end
