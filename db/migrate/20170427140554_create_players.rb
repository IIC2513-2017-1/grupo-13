class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password, null: false
      t.string :mail, null: false
      t.string :position, null:false
      t.integer :age

      t.timestamps
    end
      add_index :players, :mail, unique: true
  end
end
