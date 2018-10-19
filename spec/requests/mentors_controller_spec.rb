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

  describe "GET /mentors/:id" do
    let(:mentor) { create(:mentor) }

    context "request is valid" do
      before { get "/mentors/#{mentor.id}" }
      it "returns mentors" do
        expect(json["skill"]).to eq(mentor.skill)
      end
    end
    context "request is invalid" do
      before { get "/mentors/0" }
      it "returns a failure message" do
        expect(response.body).to eq("{\"message\":\"Couldn't find Mentor\"}")
      end
      it "returns status code 422" do
        expect(response).to have_http_status(404)
      end
    end

  end

  describe "POST /mentors" do
    let(:user) { create(:user) }
    let(:valid_attributes) { { mentor: { user_id: user.id, bio: "Expecto Patronum", skill: "Lumos" } } }
    let(:invalid_attributes) { { mentor: { user_id: user.id, bio: "Expecto Patronum"} } }

    context "request is valid" do
      before { post "/mentors", params: valid_attributes }
      it "creates a mentor" do
        expect(json["skill"]).to eq("Lumos")
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "request is invalid" do
      before { post "/mentors", params: invalid_attributes }
      it "returns a failure message" do
        expect(response.body).to eq("{\"message\":\"Validation failed: Skill can't be blank\"}")
      end
      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end


end
