# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  subject(:res) { response }
  subject(:body) { JSON.parse(response.body, symbolize_names: true) }

  shared_examples 'it has bad_request status' do
    it { expect(res).to have_http_status(:bad_request) }
  end

  describe "GET #index" do
    let!(:new_fixed_rate) { create(:new_fixed_rate) }

    before { get :index }

    it { expect(res).to have_http_status(:success) }
    it { expect(body).to include(:value, :fixed, :ends_at) }
  end

  describe 'PUT #update' do
    let(:valid_params) do
      {
        value: 60.3201,
        ends_at: '2040-01-01 00:00:00'
      }
    end

    before { put :update, params: params }

    context 'valid params' do
      let(:params) { valid_params }

      it { expect(res).to have_http_status(:created) }

      it 'broadcast value to rates_channel' do
        expect { put :update, params: params }
          .to have_broadcasted_to('rates_channel')
          .with(title: 'rate updated', body: { value: 60.3201 })
      end
    end

    context 'invalid value' do
      context 'value 0' do
        let(:params) { valid_params.merge(value: 0) }
        it_behaves_like 'it has bad_request status'
      end

      context 'value nil' do
        let(:params) { valid_params.merge(value: nil) }
        it_behaves_like 'it has bad_request status'
      end
    end

    context 'invalid ends_at' do
      context 'ends_at not a date' do
        let(:params) { valid_params.merge(ends_at: 'string') }
        it_behaves_like 'it has bad_request status'
      end

      context 'ends_at is a date in the past' do
        let(:params) { valid_params.merge(ends_at: '1999-01-01') }
        it_behaves_like 'it has bad_request status'
      end
    end
  end
end
