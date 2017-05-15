class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :player_id
      t.integer :cards
      t.integer :goals
      t.string :tipo

      t.timestamps
    end
  end
end
