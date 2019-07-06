# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    render json: RatesService.newest_fixed_rate
  end
end
