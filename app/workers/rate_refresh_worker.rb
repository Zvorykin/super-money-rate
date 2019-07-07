# frozen_string_literal: true

class RateRefreshWorker
  include Sidekiq::Worker

  def perform
    RateRefreshService.call
  end
end
