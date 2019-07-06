# frozen_string_literal: true

module RatesService
  # TODO: should we use Redis instead of SQL?
  class << self
    def current_rate
      current_fixed_rate || newest_non_fixed_rate
    end

    def current_fixed_rate
      Rate.fixed.ends_in_future.first
    end

    def newest_fixed_rate
      Rate.fixed.newest.first
    end

    def newest_non_fixed_rate
      Rate.non_fixed.newest.first
    end

    def newest_rate_update_ends_at
      rate = Rate.newest
      rate.update(ends_at: Time.now) if rate.present?
    end

    def create_non_fixed_rate(value)
      newest_rate_update_ends_at

      Rate.create!(value: value)
    end

    def create_fixed_rate(value, ends_at)
      newest_rate_update_ends_at

      Rate.create!(value: value,
                   ends_at: ends_at,
                   fixed: true)
    end
  end
end
