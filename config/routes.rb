# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'root#index'

  scope 'api', defaults: { format: :json } do
    scope 'v1' do
      get 'rates/index'

      get 'admin/index'
      put 'admin/update'
    end
  end
end
