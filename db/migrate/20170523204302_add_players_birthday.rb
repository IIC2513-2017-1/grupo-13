class AddPlayersBirthday < ActiveRecord::Migration[5.0]
  def change
    drop_column :players, :age
    add_column :players, :birthday, :datetime
  end
end
