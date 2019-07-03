# frozen_string_literal: true

class FixedRate < ApplicationRecord
  validate value, presence: true
  validate due, presence: true
end
