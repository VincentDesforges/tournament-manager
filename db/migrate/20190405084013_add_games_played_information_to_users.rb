class AddGamesPlayedInformationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :games_played, :integer, default: 0
    add_column :users, :victories, :integer, default: 0
    add_column :users, :defeats, :integer, default: 0
  end
end
