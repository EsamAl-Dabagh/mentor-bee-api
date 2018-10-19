require "rails_helper"

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => token_generator(user.id) } }

  subject(:valid_request_object) { described_class.new(header) }
  subject(:invalid_request_object) { described_class.new({}) }

  describe "#call" do
    context "when request is valid" do
      it "returns the user object" do
        result = valid_request_object.call
        expect(result[:user]).to eq(user)
      end
    end
  end
end
