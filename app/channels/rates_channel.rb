# frozen_string_literal: true

class RatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rates_channel'
  end
end
