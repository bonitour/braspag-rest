require 'spec_helper'

describe BraspagRest::TokenManager do
  let(:headers) do
    { 'Content-Type' => 'application/x-www-form-urlencoded',
      'Authorization' => 'Basic YWJmMjY1OTQtYjc1OC00YTY5LTg0MWQtZTI1NDI4NWY3MDY4Omk4eFBnVDJzZFBHaEFJeS9SSVRnZ3JSc3BMRGJQbGVNT3JpOVVYWjZNcjA9' }
  end

  before do
    ENV['RACK_ENV'] = 'production'
    BraspagRest.config do |configuration|
      configuration.config_file_path = 'spec/fixtures/configuration.yml'
      configuration.environment = 'test'
    end
  end

  describe '#token' do
    context 'application does not have an access token' do
      it 'should get one' do
        expect(RestClient::Request).to receive(:execute).with(
          method: :post,
          url: BraspagRest.config.oauth2_url,
          headers: headers,
          payload: 'grant_type=client_credentials'
        ).and_return({ access_token: 'tokenencriptado', "expires_in": 86_399 }.to_json)

        expect(BraspagRest::TokenManager.token).to eq('Bearer tokenencriptado')
      end
    end
  end
end
