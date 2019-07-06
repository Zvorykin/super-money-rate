# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    render json: FixedRatesService.newest_fixed_rate
  end
end
