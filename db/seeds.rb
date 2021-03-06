# Clear tables
puts "=====Starting Seed====="
puts "Clearing database..."
Event.destroy_all
User.destroy_all
Game.destroy_all
Tournament.destroy_all

# Adding data: ----------------------------------------------
# Users: ----------------------------------------------------
puts "Adding Users..."
User.create!({
  email:    "vince@vince.com",
  password: "123456",
  admin:    true,
  name: "Admin Vincent",
  address: 'Hong Kong'
})
sleep(2)

User.create!({
  email:    "vince2@vince.com",
  password: "123456",
  admin:    false,
  name: "Simple Vincent",
  address: 'Sydney Australia'
})
sleep(2)

# Games: ----------------------------------------------------
puts "Adding Games..."

Game.create!({
  title: "Chess",
  description: "2 person strategy game"
})

Game.create!({
  title: "Snap",
  description: "2 person card game involving reflexes"
})

Game.create!({
  title: "Thumb war",
  description: "Finger dexterity game"
})

# Tournaments: ----------------------------------------------
puts "Adding Tournaments..."
tourney1 = Tournament.new({
  name: 'Best tournament',
  max_players: 10,
  address: 'Peninsula Square, East Greenwich'
})
tourney1.save!
sleep(2) #free API requires less than one request per second

tourney2 = Tournament.new({
  name: 'Bestest tournament',
  max_players: 4,
  address: 'Grand-Place, 1000 Brussels'
})
tourney2.save!
sleep(2)

# Events: ---------------------------------------------------
puts "Adding Events..."
allGames = Game.all
Event.create!({
  tournament: tourney1,
  game: allGames[0]
})
Event.create!({
  tournament: tourney1,
  game: allGames[1]
})

Event.create!({
  tournament: tourney2,
  game: allGames[1]
})
Event.create!({
  tournament: tourney2,
  game: allGames[2]
})

# Matches: --------------------------------------------------
puts "Adding Matches..."
allEvents = Event.all

Match.create!({ #Last wins
  player_1: User.first,
  player_2: User.last,
  event: allEvents[1],
  score_player_2: 1,
  finished: true
})

Match.create!({ #First wins
  player_1: User.last,
  player_2: User.first,
  event: allEvents[0],
  score_player_2: 1,
  finished: true
})

Match.create!({
  player_1: User.first,
  player_2: User.last,
  event: allEvents[2]
})

Match.create!({ #First wins
  player_1: User.first,
  player_2: User.last,
  event: allEvents[3],
  score_player_1: 3,
  finished: true
})
puts "=====End of Seed====="
