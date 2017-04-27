class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password, null: false
      t.string :mail, null: false
      t.integer :age, null: false

      t.timestamps
    end
    add_index :organizers, :mail, unique: true

  end
end
