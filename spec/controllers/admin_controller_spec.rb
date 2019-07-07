# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe "GET #index" do
    let!(:new_fixed_rate) { create(:new_fixed_rate) }

    before { get :index }

    subject(:res) { response }
    subject(:body) { JSON.parse(response.body, symbolize_names: true) }

    it { expect(res).to have_http_status(:success) }
    it { expect(body).to include(:value, :fixed, :ends_at) }
  end
end
