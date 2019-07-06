# frozen_string_literal: true

class RatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rates_channel'

    rate = RatesService.current_rate
    BroadcastRateService.call(rate.value) if rate.present?
  end
end
