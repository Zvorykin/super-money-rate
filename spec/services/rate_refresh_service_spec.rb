# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateRefreshService do
  subject { described_class.call }

  describe 'rate does not refresh' do
    it 'do nothing if fixed rate present' do
      allow(RatesService).to receive(:current_fixed_rate) { { value: 60 } }
      is_expected.to eq nil
    end

    it 'do nothing if no responce from remote' do
      allow(RemoteRateService).to receive(:call)
      is_expected.to eq nil
    end
  end

  describe 'rate refresh' do
    let(:new_value) { 61.3 }

    it 'create new record' do
      allow(RemoteRateService).to receive(:call) { new_value }

      is_expected.to have_attributes(value: new_value)
    end

    it 'create new record and broadcast value' do
      allow(RemoteRateService).to receive(:call) { new_value }

      expect { described_class.call }
        .to have_broadcasted_to('rates_channel')
        .with(title: 'rate updated', body: { value: new_value })
    end
  end
end
