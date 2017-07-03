class Invitacion < ActiveRecord::Migration[5.0]
  def change
    add_column :teamplayers, :i_team, :boolean, default: false
    add_column :teamplayers, :i_player, :boolean, default: false
    add_column :tournamentteams, :i_tournament, :boolean, default: false
    add_column :tournamentteams, :i_team, :boolean, default: false
  end
end
