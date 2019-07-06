# frozen_string_literal: true

class Rate < ApplicationRecord
  validates :value, numericality: { greater_than: 0 }
  # validates :ends_at, :presence, if: proc { |r| r.fixed == true }

  scope :fixed, -> { where(fixed: true) }
  scope :non_fixed, -> { where(fixed: false) }
  scope :ends_in_future, -> { where(arel_table[:ends_at].gteq(Time.zone.now)) }
  scope :newest, -> { order(id: :desc).limit(1) }
end
