class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      # https://dankim.io/mutual-friendship-rails/
      t.integer :score
      t.boolean :finished
      t.references :player_1
      t.references :player_2
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
