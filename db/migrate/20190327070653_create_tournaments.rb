class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.datetime :date
      t.integer :max_players
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
