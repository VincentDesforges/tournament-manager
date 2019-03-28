class Event < ApplicationRecord
  belongs_to :tournament
  belongs_to :game

  validates :tournament, presence: true #Event needs tournament
  validates :game, presence: true #Event needs game
  validates :tournament, uniqueness: { scope: :game } #Only one event per tournament game pair
end
