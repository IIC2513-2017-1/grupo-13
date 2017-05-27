class Match < ActiveRecord::Migration[5.0]
  def change
    drop_table :matches
    create_table :matches do |t|
      t.string :local, null: false
      t.string :visitor, null: false
      t.integer :date, null: false
      t.string :tournament_id, null: false
      t.timestamps
    end
  end
end
