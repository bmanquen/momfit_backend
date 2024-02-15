# frozen_string_literal: true

# Created events table
class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :image
      t.string :title
      t.text :description
      t.datetime :data
      t.string :location
      t.float :cost

      t.timestamps
    end
  end
end
