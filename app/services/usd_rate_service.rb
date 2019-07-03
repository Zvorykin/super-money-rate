# frozen_string_literal: true

require 'net/http'

module UsdRateService
  class << self
    RATES_URL = URI.parse('https://www.cbr-xml-daily.ru/daily_json.js')

    def call
      usd_rate
    end

    private

    def usd_rate
      JSON.parse(response, symbolize_names: true)
          .dig(:Valute, :USD, :Value)
    end

    def response
      Net::HTTP.get(RATES_URL)
    end
  end
end
