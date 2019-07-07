# frozen_string_literal: true

require "rails_helper"

RSpec.describe RatesChannel, type: :channel do
  it 'subscribes' do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from('rates_channel')
  end
end