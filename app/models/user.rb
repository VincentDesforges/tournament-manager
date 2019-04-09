class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # IMPORTANT Notes: 
  # Each user may be player_1 or player_2 in several matches
  # player_1_match refers to the matches where the user is player_1
  has_many :player_1_matches, class_name: 'Match', foreign_key: :player_1_id
  has_many :player_2_matches, class_name: 'Match', foreign_key: :player_2_id
  has_many :player_1s, through: :player_2_matches
  has_many :player_2s, through: :player_1_matches

  def total_points
    (self.games_played - self.victories - self.defeats) + self.victories * 3
  end

  def matches
    # Merging the player_1 and the player_2 in a way that can be scoped
    self.player_1_matches.or(self.player_2_matches)
  end


  def update_matches_played_info
    # find all matches completed
    self.games_played = self.matches.finished.count
    # find number of victories
    self.victories = self.matches.victories(self).count
    # find number of defeats
    self.defeats = self.matches.defeats(self).count
    # save the updated user
    self.save
  end
end