# frozen_string_literal: true

# Added summary column to events table
class AddSummaryToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :summary, :string
  end
end
