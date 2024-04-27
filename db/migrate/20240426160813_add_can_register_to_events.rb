class AddCanRegisterToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :can_register, :boolean, :default => false
  end
end
