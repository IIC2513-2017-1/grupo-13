class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :capitan
      t.string :logo    # luego sera un path a un archivo de imagen
      t.timestamps
    end
    add_index :teams, :name
  end
end
