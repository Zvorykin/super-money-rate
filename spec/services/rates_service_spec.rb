# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatesService do
  describe '#current_rate' do
    subject { described_class.current_rate }

    context 'fix rate exist' do
      let!(:new_fixed_rate) { create(:new_fixed_rate) }
      let!(:old_fixed_rate) { create(:old_fixed_rate) }
      let!(:new_non_fixed_rate) { create(:new_non_fixed_rate) }

      it { is_expected.to eq new_fixed_rate }
    end

    context 'fix rate not exist' do
      let!(:old_non_fixed_rate) { create(:old_non_fixed_rate) }
      let!(:new_non_fixed_rate) { create(:new_non_fixed_rate) }

      it { is_expected.to eq new_non_fixed_rate }
    end
  end

  describe '#current_fixed_rate' do
    let!(:old_fixed_rate) { create(:old_fixed_rate) }
    let!(:new_fixed_rate) { create(:new_fixed_rate) }

    it { expect(described_class.current_fixed_rate).to eq new_fixed_rate }
  end

  describe '#newest_fixed_rate' do
    # reverse creation order!
    let!(:new_fixed_rate) { create(:new_fixed_rate) }
    let!(:old_fixed_rate) { create(:old_fixed_rate) }

    it { expect(described_class.newest_fixed_rate).to eq old_fixed_rate }
  end

  describe '#newest_non_fixed_rate' do
    let!(:old_non_fixed_rate) { create(:old_non_fixed_rate) }
    let!(:new_non_fixed_rate) { create(:new_non_fixed_rate) }

    it { expect(described_class.newest_non_fixed_rate).to eq new_non_fixed_rate }
  end

  describe '#newest_rate_update_ends_at' do
    let!(:new_non_fixed_rate) { create(:new_non_fixed_rate) }
    let!(:old_non_fixed_rate) { create(:old_non_fixed_rate) }

    before { described_class.newest_rate_update_ends_at }

    subject { Rate.newest.first.ends_at.round }

    it { is_expected.to eq Time.zone.now.round }
  end

  describe '#create_fixed_rate' do
    let!(:old_non_fixed_rate) { create(:old_non_fixed_rate) }
    let(:attrs) do
      {
        value: 60,
        fixed: true,
        ends_at: Time.zone.tomorrow
      }
    end

    before { described_class.create_fixed_rate(attrs[:value], attrs[:ends_at]) }

    describe 'new record attributes' do
      subject { Rate.newest.first }
      it { is_expected.to have_attributes(attrs) }
    end

    describe 'old rate ends_at' do
      subject { Rate.find(old_non_fixed_rate.id).ends_at.round }
      it { is_expected.to eq Time.zone.now.round }
    end
  end

  describe '#create_non_fixed_rate' do
    let!(:old_non_fixed_rate) { create(:old_non_fixed_rate) }
    let(:attrs) do
      {
        value: 63,
        fixed: false
      }
    end

    before { described_class.create_non_fixed_rate(attrs[:value]) }

    describe 'new record attributes' do
      subject { Rate.newest.first }
      it { is_expected.to have_attributes(attrs) }
    end

    describe 'old rate ends_at' do
      subject { Rate.find(old_non_fixed_rate.id).ends_at.round }
      it { is_expected.to eq Time.zone.now.round }
    end
  end
end
