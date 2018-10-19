require 'rails_helper'

RSpec.describe MentorshipsController, type: :request, focus: true do

  describe "GET /mentorships" do
    let!(:mentorships) { create_list(:mentorship, 5) }

    before { get "/mentorships" }

    it "returns mentorships" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end
end
