# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    render json: RatesService.current_rate
  end

  def update
    param! :value, Float, required: true, min: 0.0001
    param! :ends_at, DateTime, required: true

    if params[:ends_at] < Time.now
      raise RailsParam::Param::InvalidParameterError.new('ends_at should be in future')
    end

    fixed_rate = RatesService.create_fixed_rate(*params.values_at(:value, :ends_at))

    BroadcastRateService.call(fixed_rate.value)

    render json: fixed_rate, status: :created
  end
end
