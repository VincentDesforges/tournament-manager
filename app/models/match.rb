class Match < ApplicationRecord
  validate :players_cannot_play_themselves

  belongs_to :player_1, class_name: 'User'
  belongs_to :player_2, class_name: 'User'
  belongs_to :event

  validates :event, presence: true #Match needs an event

  private
  def players_cannot_play_themselves
      errors.add(:player_2_id, 'You cannot play against yourself') if player_1_id == player_2_id
  end
end
