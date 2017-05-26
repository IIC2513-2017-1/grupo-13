class Changename < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :tournament_name, :string
    add_column :matches, :tournament_id, :integer
  end
end
