# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'root#index'

  scope 'api', defaults: { format: :json } do
    scope 'v1' do
      get 'rates', to: 'rates#index'
      put 'rates', to: 'rates#update'

      get 'admin', to: 'admin#index'
    end
  end
end
