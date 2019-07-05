# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    render json: UsdRateService.call
  end

  def update
    param! :value, Float, required: true, min: 0.01
    param! :ends_at, DateTime, required: true

    if params[:ends_at] < Time.now
      raise RailsParam::Param::InvalidParameterError.new('ends_at should be in future')
    end

    fixed_rate = FixedRatesService.update(*params.values_at(:value, :ends_at))

    ActionCable.server.broadcast('rates_channel',
                                 title: 'rate updated',
                                 body: { value: fixed_rate.value })

    render json: fixed_rate, status: :created
  end
end
