require 'csv'
DB   = File.join(__dir__, 'db.csv')
OPT = {:encoding => 'UTF-8', :skip_blanks => true, headers: true}

def view
  CSV.foreach(DB, OPT).with_index do |row, index|
    puts "#{index + 1} - #{row}"
  end
end

def add
  puts "Please enter title"
  title = gets.chomp
  puts "Please enter author"
  author = gets.chomp
  puts "Please enter genre"
  genre = gets.chomp
  puts "Please enter century"
  century = gets.chomp
  CSV.open(DB, 'a', OPT) do |csv|
        csv.puts(["#{title}", "#{author}", "#{genre}", "#{century}"])
  end
  view
end

def suppr
  view
  puts "Please enter index :"
  index_to_delete = gets.chomp.to_i
  csv_table = []
  CSV.foreach(DB).each_with_index do |row, index|
    next if index == index_to_delete
    csv_table << row
  end
  CSV.open(DB, 'wb') do |csv|
    # csv.puts(["title", "author", "genre", "century"])
      csv_table.each do |row|
        csv.puts(row)
    end
  end
  view
end

def edit
  view
  puts "please enter the id :"
  index_to_edit = gets.chomp.to_i
  csv_table = []
  CSV.foreach(DB).each_with_index do |row, index|
    csv_table << row
  end
  p csv_table[index_to_edit]
  puts "Please enter title"
  csv_table[index_to_edit][0] = gets.chomp
  puts "Please enter author"
  csv_table[index_to_edit][1] = gets.chomp
  puts "Please enter genre"
  csv_table[index_to_edit][2] = gets.chomp
  puts "Please enter century"
  csv_table[index_to_edit][3] = gets.chomp
  CSV.open(DB, 'wb') do |csv|
    # csv.puts(["title", "author", "genre", "century"])
      csv_table.each do |row|
        csv.puts(row)
    end
  end
  view
end
