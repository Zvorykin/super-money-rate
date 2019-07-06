# frozen_string_literal: true

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_rates do |t|
      t.float :value, null: false
      t.datetime :ends_at, null: false
      t.boolean :fixed, default: false, null: false

      t.timestamps
    end
  end
end
