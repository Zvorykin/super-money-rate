# frozen_string_literal: true

class RatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rates_channel'

    rate = FixedRatesService.current_fixed_rate
    BroadcastRateService.call(rate.value) if rate.present?
  end
end
