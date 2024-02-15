# frozen_string_literal: true

# Added childcare column to events table
class AddChildcareToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :childcare, :string
  end
end
