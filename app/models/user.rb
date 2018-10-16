class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
end
