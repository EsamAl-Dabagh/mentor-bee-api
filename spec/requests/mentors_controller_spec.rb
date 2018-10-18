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
end
