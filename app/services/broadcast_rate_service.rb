# frozen_string_literal: true

require 'net/http'

module BroadcastRateService
  class << self
    def call(value)
      ActionCable.server.broadcast(
        'rates_channel',
        title: 'rate updated',
        body: { value: value }
      )
    end
  end
end
