# frozen_string_literal: true

class RatesController < ApplicationController
  def index
    render json: UsdRateService.call
  end

  def update
    param! :value, Float, required: true
    param! :due, DateTime, required: true

    FixedRate.create(
      due: params[:due],
      value: params[:value]
    )
  end
end
