require_relative 'db'

loop do
  puts "1. View all books"
  puts "2. Add a book"
  puts "3. Delete a book"
  puts "4. Edit a book"
  puts "5. Exit"

  choice = gets.chomp.to_i

  case choice
    when 1 then view
    when 2 then add
    when 3 then suppr
    when 4 then edit
    when 5 then break
  end

end
