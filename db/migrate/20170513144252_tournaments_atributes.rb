class TournamentsAtributes < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :number_date, :integer, null:false
    add_column :tournaments, :number_team, :integer, null:false
  end
end
