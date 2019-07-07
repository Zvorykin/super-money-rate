# frozen_string_literal: true

FactoryBot.define do
  factory :old_fixed_rate, class: 'Rate' do
    value { 60.5 }
    fixed { true }
    ends_at { "2019-07-03 18:29:43" }
  end

  factory :new_fixed_rate, class: 'Rate' do
    value { 63.5 }
    fixed { true }
    ends_at { "2040-07-03 18:29:43" }
  end

  factory :old_non_fixed_rate, class: 'Rate' do
    value { 59.0 }
    ends_at { "2019-07-03 18:29:43" }
  end

  factory :new_non_fixed_rate, class: 'Rate' do
    value { 60.0 }
    ends_at { "2019-07-06 00:00:00" }
  end
end
