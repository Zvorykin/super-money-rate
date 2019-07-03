# frozen_string_literal: true

class CreateFixedRates < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_rates do |t|
      t.float :value, null: false
      t.datetime :due, null: false

      t.timestamps
    end
  end
end
