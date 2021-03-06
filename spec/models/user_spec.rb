require "rails_helper"

RSpec.describe User, type: :model do
  context "has email, password, and name" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:name) }
  end

  context "email is unique" do
    it { should validate_uniqueness_of(:email) }
  end

  context "can have mentor and mentee associations" do
    it { should have_one(:mentee) }
    it { should have_one(:mentor) }
  end
end
