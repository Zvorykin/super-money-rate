# frozen_string_literal: true

FactoryBot.define do
  factory :fixed_rate do
    value { 1.5 }
    due { "2019-07-03 18:29:43" }
  end
end
