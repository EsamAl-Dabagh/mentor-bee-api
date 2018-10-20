require "rails_helper"

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { "Authorization" => token_generator(user.id) } }

  subject(:valid_request_object) { described_class.get_user(header["Authorization"]) }
  subject(:invalid_request_object) { described_class.get_user(nil) }

  describe "#get_user" do
    context "when request is valid" do
      it "returns the user object" do
        result = valid_request_object
        expect(result).to eq(user)
      end
    end

    context "when the request is invalid" do
      context "if the token is missing" do
        it "raises the MissingToken error" do
          expect { invalid_request_object }.to raise_error(ExceptionHandler::MissingToken, "Missing token")
        end
      end

      context "when invalid token is given" do
        subject(:invalid_request_object) do
          described_class.get_user(token_generator(0))
        end

        it "raises AR error when record does not exist" do
          expect { invalid_request_object }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      context "when token is expired (>24hr)" do
        let(:header) { { "Authorization" => expired_token_generator(user.id) } }

        it "raises expired signature error" do
          expect { valid_request_object }.to raise_error(ExceptionHandler::InvalidToken, "Signature has expired")
        end
      end
    end

    context "when a fake token is given" do
        let(:header) { { "Authorization" => "qwerty" } }

        it "handles JWT::DecodeError" do
          expect { valid_request_object }.to raise_error(ExceptionHandler::InvalidToken, "Not enough or too many segments")
        end
      end
  end
end
