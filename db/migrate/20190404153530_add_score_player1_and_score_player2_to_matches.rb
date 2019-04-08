class AddScorePlayer1AndScorePlayer2ToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :score_player_1, :integer, default: 0
    add_column :matches, :score_player_2, :integer, default: 0
    remove_column :matches, :score
  end
end