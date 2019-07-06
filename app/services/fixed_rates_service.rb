# frozen_string_literal: true

require 'net/http'

module FixedRatesService
  class << self
    def current_fixed_rate
      FixedRate.where(FixedRate.arel_table[:ends_at].gteq(Time.now))
               .first
    end

    def newest_fixed_rate
      FixedRate.order(id: :desc).limit(1).first
    end

    def update(value, ends_at)
      rate_params = {
        value: value,
        ends_at: ends_at
      }

      current_rate = current_fixed_rate
      current_rate.update(ends_at: Time.now) if current_rate.present?

      FixedRate.create!(rate_params)
    end
  end
end
