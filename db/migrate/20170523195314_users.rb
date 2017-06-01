class Users < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :is_organizer, :boolean
  end
end
