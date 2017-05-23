class AddPlayersBirthday < ActiveRecord::Migration[5.0]
    def change
    remove_column :players, :age
    add_column :players, :birthday, :datetime
  end
end
