require "rails_helper"

RSpec.describe UsersController do
  let!(:users) { create_list(:user, 5) }

  describe "GET /users" do
    before { get "/users", params: {}, headers: valid_headers }

    it "returns users" do
      expect(json["users"]).not_to be_empty
      expect(json["users"].size).to eq(User.count)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    let(:valid_attributes) { { user: { name: "Albus Dumbledore", email: "email@email.com", password: "123456", pic: "nil" } } }
    let(:invalid_attributes) { { user: { name: "Albus Dumbledore" } } }

    context "when the request is valid" do
      before { post "/users", params: valid_attributes }
      it "creates a user" do
        expect(json["auth_token"]).not_to be_nil
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request isn't valid" do
      before { post "/users", params: invalid_attributes }
      it "returns a failure message" do
        expect(response.body).to eq("{\"message\":\"Validation failed: Password can't be blank, Email can't be blank\"}")
      end
      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET /users/:id" do
    let(:user_id) { users.first.id }
    let(:nonexistent_user_id) { 0 }

    context "when the user exists" do
      before { get "/users/#{user_id}", headers: valid_headers }
      it "returns a user" do
        expect(json["user"]["id"]).to eq(user_id)
      end
      it "returns a status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the user doesn't exist" do
      before { get "/users/#{nonexistent_user_id}", headers: valid_headers }
      it "returns a failure message" do
        expect(response.body).to eq("{\"message\":\"Couldn't find User\"}")
      end
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
