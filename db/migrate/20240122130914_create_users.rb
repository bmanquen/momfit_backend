# frozen_string_literal: true

# Created users table
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :role

      t.timestamps
    end
  end
end
