require "rails_helper"

RSpec.describe UsersController, type: :request do
  let!(:users) { create_list(:user, 5) }

  describe "GET /users" do
    before { get "/users" }

    it "returns users" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do

    let(:valid_attributes) { { user: { name: "Albus Dumbledore", email: "email@email.com", password: "123456", pic: "nil" } } }

    context "when the request is valid" do
      before { post "/users", params: valid_attributes }

      it "creates a user" do
        expect(json["name"]).to eq("Albus Dumbledore")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
  end
end
