require_relative "user"
require "date"

user1 = User.new("user1@domain.com", "Alfred")
user2 = User.new("user2@domain.com", "Boris")
user3 = USer.new("user3@domain.com", "Romain")
p user1.birthdate = Date.new(1992, 9, 18)
p user1.birthdate = Date.new(1987, 11, 7)
p user1.birthdate = Date.new(1983, 12, 13)

user1.add_friend!(user2)
user1.add_friend!(user3)

p user1.change_password!("passancien", "passnouveau")
p user1.age
