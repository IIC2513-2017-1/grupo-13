class AddIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :events, [:player_id,:match_id], unique: true
    add_index :matches, [:local,:visitor,:date], unique: true
    add_index :nominates, [:player_id,:team_id,:match_id], unique: true
    add_index :results, [:match_id,:local,:visitor], unique: true
    add_index :teamplayers, [:team_id,:player_id], unique: true
    add_index :tournamentteams, [:tournament_id,:team_id], unique: true
  end
end
