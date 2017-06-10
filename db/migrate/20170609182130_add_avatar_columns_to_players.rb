class AddAvatarColumnsToPlayers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :players, :avatar
  end

  def down
    remove_attachment :player, :avatar
  end
end
