class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :organizer, null: false
      t.string :place, null: false
      t.string :bases  ## archivos bases - horarios - premios
      t.timestamps
    end
    add_index :tournaments, :name
  end
end
