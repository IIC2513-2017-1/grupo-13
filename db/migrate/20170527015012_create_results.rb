class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :match_id, null: false
      t.integer :local, null: false
      t.integer :visitor, null: false
      t.timestamps
    end
  end
end
