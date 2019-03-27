# Clear tables
puts "=====Starting Seed====="
puts "Clearing database..."
User.destroy_all
Game.destroy_all
Tournament.destroy_all

# Adding data: ----------------------------------------------
# Users: ----------------------------------------------------
puts "Adding Users..."
User.create!({
  email:    "vince@vince.com",
  password: "123456",
  admin:    true
})

User.create!({
  email:    "vince2@vince.com",
  password: "123456",
  admin:    false
})

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
puts "Adding Events?????..."
# Matches: --------------------------------------------------
puts "Adding Matches?????..."
puts "=====End of Seed====="
