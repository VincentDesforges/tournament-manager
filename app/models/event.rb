class Event < ApplicationRecord
  belongs_to :tournament
  belongs_to :game
end
