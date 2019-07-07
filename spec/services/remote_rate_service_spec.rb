# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoteRateService do
  let(:fake_body) do
    File.read(Rails.root.join('spec', 'fake_data', 'remote_rate_service_body.json'))
  end

  before do
    stub_request(:get, "https://www.cbr-xml-daily.ru/daily_json.js")
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Host' => 'www.cbr-xml-daily.ru',
          'User-Agent' => 'Ruby'
        })
      .to_return(status: 200, body: fake_body, headers: {})
  end

  subject { described_class.call }

  it { is_expected.to eq 63.5841 }
end