# frozen_string_literal: true

class FixedRate < ApplicationRecord
  validates :value, presence: true
  validates :ends_at, presence: true
end
