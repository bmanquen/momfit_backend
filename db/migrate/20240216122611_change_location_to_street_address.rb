# frozen_string_literal: true

# Rename location column to street_address, add city, state, and zipcode columns to events table
class ChangeLocationToStreetAddress < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :location, :street_address
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :zipcode, :integer
  end
end
