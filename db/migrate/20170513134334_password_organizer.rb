class PasswordOrganizer < ActiveRecord::Migration[5.0]
  def change
    add_column :organizers, :password_digest, :string
    remove_column :organizers, :password
  end
end
