require 'faker'
user = User.first

5.times {
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password_hash: "password" )
}

User.all.each do |user|
  user.games << Game.create
end


