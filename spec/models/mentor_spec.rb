require "rails_helper"

RSpec.describe Mentor, type: :model do
  context "belongs to a user" do
    it { should belong_to(:user) }
  end

  context "has mentorships" do
    it { should have_many(:mentorships) }
  end

  context "has bio, skills and user_id" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:skill) }
  end
end
