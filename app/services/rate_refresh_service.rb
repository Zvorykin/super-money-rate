# frozen_string_literal: true

module RateRefreshService
  class << self
    def call
      return if RatesService.current_fixed_rate.present?

      remote_rate_value = RemoteRateService.call
      if remote_rate_value.nil?
        Rails.logger.warn(`wrong remote rate value: #{remote_rate_value}`)
        return
      end

      non_fixed_rate = RatesService.newest_non_fixed_rate || {}

      BroadcastRateService.call(remote_rate_value) if non_fixed_rate[:ends_at].nil?

      RatesService.create_non_fixed_rate(remote_rate_value) \
      unless non_fixed_rate[:value] == remote_rate_value.to_f
    end
  end
end
