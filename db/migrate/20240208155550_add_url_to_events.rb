# frozen_string_literal: true

# Added url column to events table
class AddUrlToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :url, :string
  end
end
