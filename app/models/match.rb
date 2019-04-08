class Match < ApplicationRecord
  after_save :update_users_on_match_finished

  validate :players_cannot_play_themselves

  belongs_to :player_1, class_name: 'User', optional: true
  belongs_to :player_2, class_name: 'User', optional: true
  belongs_to :event

  validates :event, presence: true #Match needs an event

  def winning?(player)
    player == self.winner
  end

  def losing?(player)
    self.winner ? self.winner != player ? true : false : false
  end

  def winner
    self.score_player_1 > self.score_player_2 ? self.player_1 : self.score_player_2 > self.score_player_1 ? self.player_2 : nil
  end

  def can_join?(user)
    unless self.finished || self.player_1 && self.player_2
      return false if self.player_1 == user
      return false if self.player_2 == user
      return true
    end
    return false
  end

  # Scopes:
  scope :finished, -> { where(finished: true)}
  scope :victories, ->(player) { where("finished = true AND ((score_player_1 > score_player_2 AND player_1_id = ?) OR (score_player_2 > score_player_1 AND player_2_id = ?))", player.id, player.id) }
  scope :defeats, ->(player) { where("finished = true AND ((score_player_1 < score_player_2 AND player_1_id = ?) OR (score_player_2 < score_player_1 AND player_2_id = ?))", player.id, player.id) }

  private
  def players_cannot_play_themselves
      # Here we need to check not nil for one because nil == nil fails the condition otherwise but is allowable
      errors.add(:player_2_id, 'You cannot play against yourself') if (player_1_id == player_2_id  && player_1_id!= nil)
  end

  def update_users_on_match_finished
    # delete match if no one is playing
    if self.player_1 == nil && self.player_2 == nil
      self.delete
    end

    #update player stats once game is finished
    if self.finished
      self.player_1.update_matches_played_info
      self.player_2.update_matches_played_info
    end
  end
end
