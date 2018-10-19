require "rails_helper"

RSpec.describe Mentorship, type: :model do
  context "has a mentor and mentee" do
    it { should belong_to(:mentor) }
    it { should belong_to(:mentee) }
  end
end
