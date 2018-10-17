class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
  has_one :mentee
  has_one :mentor
end
