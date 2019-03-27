class Tournament < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :events
  has_many :games, through: :events
end
