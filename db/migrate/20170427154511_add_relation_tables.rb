class AddRelationTables < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :local, null: false
      t.string :visitor, null: false
      t.integer :date, null: false
      t.string :tournament_name, null: false
      t.timestamps
    end
    create_table :nominates do |t|
      t.string :team_id, null: false
      t.string :match_id, null: false
      t.string :player_id, null: false
      t.timestamps
    end
    create_table :cards do |t|
      t.string :match_id, null: false
      t.string :player_id, null: false
      t.string :type, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
    create_table :goals do |t|
      t.string :match_id, null: false
      t.string :player_id, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
    create_table :team_player do |t|
      t.string :player_id, null: false
      t.string :team_id, null: false
      t.timestamps
    end
    create_table :tournament_team do |t|
      t.string :tournament_id, null: false
      t.string :team_id, null: false
      t.timestamps
    end
  end
end
