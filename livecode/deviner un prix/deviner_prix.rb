number_to_guess = rand(1..100)
puts "Devinez un nombre entre 1 et 100 :"
user_input = gets.chomp
counter = 0

while user_input != number_to_guess
  puts "Essaye encore"
  user_input = gets.chomp
  counter += 1
  if counter < 5
    if user_input > number_to_guess
      puts "trop gand"
    elsif user_input < number_to_guess
      puts "trop petit"
    else
      puts "gagné"
  end
  else
    puts "trop d'essais"
    counter = 0
  end
end
