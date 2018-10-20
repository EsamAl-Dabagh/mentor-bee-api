require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create(:user) }
  let(:headers) { { "Authorization" => token_generator(user.id) } }
  let(:tokenless_headers) { { "Authorization" => nil } }

  describe "#authorize_request" do
    context "when authentication token is given" do
      before { allow(request).to receive(:headers).and_return(headers) }

      it "sets the current user when authorized successfully" do
        expect(subject.instance_eval { authorize_request }).to eq(user)
      end
    end

    context "when authentication token is not given" do
      before { allow(request).to receive(:headers).and_return(tokenless_headers) }

      it "sets the current user when authorized successfully" do
        expect { subject.instance_eval { authorize_request } }.to raise_error(ExceptionHandler::MissingToken, "Missing token")
      end
    end
  end
end
