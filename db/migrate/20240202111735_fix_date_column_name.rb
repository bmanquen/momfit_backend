# frozen_string_literal: true

# Changed name of data column to date
class FixDateColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :data, :date
  end
end
