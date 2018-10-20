require "rails_helper"

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { "Authorization" => token_generator(user.id) } }

  subject(:valid_request_object) { described_class.new(header) }
  subject(:invalid_request_object) { described_class.new({}) }

  describe "#call" do
    context "when request is valid" do
      it "returns the user object" do
        result = valid_request_object.call
        expect(result[:user]).to eq(user)
      end
    end

    context "when the request is invalid" do
      context "if the token is missing" do
        it "raises the MissingToken error" do
          expect { invalid_request_object.call }.to raise_error(ExceptionHandler::MissingToken, "Missing token")
        end
      end

      context "when invalid token is given" do
        subject(:invalid_request_object) do
          described_class.new("Authorization" => token_generator(5))
        end

        it "raises the InvalidToken error" do
          expect { invalid_request_object.call }.to raise_error(ExceptionHandler::InvalidToken, "Invalid token")
        end
      end

      context "when token is expired (>24hr)" do
        let(:header) { { "Authorization" => expired_token_generator(user.id) } }

        it "raises expired signature error" do
          expect { valid_request_object.call }.to raise_error(ExceptionHandler::InvalidToken, "Signature has expired")
        end
      end
    end
  end
end
