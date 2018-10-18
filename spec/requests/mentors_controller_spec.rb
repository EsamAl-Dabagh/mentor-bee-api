require "rails_helper"

RSpec.describe MentorsController, type: :request do
  let!(:mentors) { create_list(:mentor, 5) }

  describe "GET /mentors" do
    before { get "/mentors" }

    it "returns mentors" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /mentors" do
    let(:user) { create(:user) }
    let(:valid_attributes) { { mentor: { user_id: user.id, bio: "Expecto Patronum", skill: "Lumos" } } }

    context "request is valid" do
      before { post "/mentors", params: valid_attributes }

      it "creates a mentor" do
        expect(json["skill"]).to eq("Lumos")
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end
end
