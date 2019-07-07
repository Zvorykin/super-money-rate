# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rate, type: :model do
  subject { build(:new_fixed_rate) }

  describe 'validations' do
    it { is_expected.to be_valid }

    it 'is invalid without value' do
      subject.value = nil
      is_expected.not_to be_valid
    end

    context 'ends_at presence' do
      before { subject.ends_at = nil }

      it 'is invalid if fixed = true without ends_at' do
        subject.fixed = true
        is_expected.not_to be_valid
      end

      it 'is valid if fixed = false without ends_at' do
        subject.fixed = false
        is_expected.to be_valid
      end
    end
  end

  describe 'scopes' do
    context 'fixed' do
      let!(:old_fixed_rate) { create(:old_fixed_rate) }
      let!(:new_non_fixed_rate) { create(:new_non_fixed_rate) }

      it { expect(described_class.fixed.to_a).to eq [old_fixed_rate] }
    end

    context 'non_fixed' do
      let!(:old_fixed_rate) { create(:old_fixed_rate) }
      let!(:new_non_fixed_rate) { create(:new_non_fixed_rate) }

      it { expect(described_class.non_fixed.to_a).to eq [new_non_fixed_rate] }
    end

    context 'ends_in_future' do
      let!(:old_fixed_rate) { create(:old_fixed_rate) }
      let!(:new_fixed_rate) { create(:new_fixed_rate) }

      it { expect(described_class.ends_in_future.to_a).to eq [new_fixed_rate] }
    end

    context 'newest' do
      # reverse order creation!
      let!(:new_fixed_rate) { create(:new_fixed_rate) }
      let!(:old_fixed_rate) { create(:old_fixed_rate) }

      it { expect(described_class.newest.to_a).to eq [old_fixed_rate] }
    end
  end
end
