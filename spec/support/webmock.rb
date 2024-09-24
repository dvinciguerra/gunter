## frozen_string_literal: true

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    WebMock.stub_request(:any, /example.com/).to_return(status: 200, body: 'stubbed response', headers: {})
  end
end
