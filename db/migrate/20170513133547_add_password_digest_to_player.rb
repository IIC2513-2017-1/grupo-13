class AddPasswordDigestToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :password_digest, :string
    remove_column :players, :password, :string
  end
end
