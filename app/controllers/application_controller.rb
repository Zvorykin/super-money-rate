# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :underscore_params!
  ActionController::Parameters.permit_all_parameters = true

  rescue_from RailsParam::Param::InvalidParameterError do |err|
    render json: err, status: :bad_request
  end

  private

  def underscore_params!
    params.transform_keys!(&:underscore)
  end
end
