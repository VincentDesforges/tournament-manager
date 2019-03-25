# Clear tables
puts "=====Starting Seed====="
puts "Clearing database..."
User.destroy_all
Game.destroy_all

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

# Tournaments: ----------------------------------------------
puts "Adding Tournaments????..."
# Events: ---------------------------------------------------
puts "Adding Events?????..."
# Matches: --------------------------------------------------
puts "Adding Matches?????..."
puts "=====End of Seed====="
