# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BroadcastRateService do
  let(:value) { 63.0123 }

  it 'broadcast value to rates_channel' do
    expect { described_class.call(value) }
      .to have_broadcasted_to('rates_channel')
      .with(title: 'rate updated', body: { value: value })
  end
end