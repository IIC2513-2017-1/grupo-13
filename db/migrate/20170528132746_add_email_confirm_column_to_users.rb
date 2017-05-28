class AddEmailConfirmColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :email_confirmed, :boolean, :default => false
    add_column :players, :confirm_token, :string
  end
end
