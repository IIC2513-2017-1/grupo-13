class Evets < ActiveRecord::Migration[5.0]
  def change
    drop_table :cards
    drop_table :goals
    remove_column :events, :cards
    remove_column :events, :tipo
    add_column :events, :yellow_cards, :integer
    add_column :events, :red_cards, :integer
    add_column :events, :match_id, :string
  end
end
