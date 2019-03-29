class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # IMPORTANT Notes: 
  # Each user may be player_1 or player_2 in several matches
  # player_1_match refers to the matches where the user is player_1
  has_many :player_1_matches, class_name: 'Match', foreign_key: :player_1_id
  has_many :player_2_matches, class_name: 'Match', foreign_key: :player_2_id
  has_many :player_1s, through: :player_2_matches
  has_many :player_2s, through: :player_1_matches
end

# TESTING IN CONSOLE
# v = User.first
# v2 = User.last
# mat = Match.new
# mat.player_1 = v
# mat.player_2 = v2
# mat.event = Event.first
# mat.save
# mat
# mat.player_1
# mat.player_2
# v.player_1_matches
# v.player_2s