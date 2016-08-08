require 'date'

puts "Date à vérifier"
date = gets.chomp

def days_until_xmas(date)
   formated_date = Date.parse(date)
   year = formated_date.year
   result = (Date.parse("25/12/#{year}") - Date.parse(date)).to_i
    if result < 0
      year += 1
      result = (Date.parse("25/12/#{year}") - Date.parse(date)).to_i)
    end
    return result
end

puts "Il nous reste #{days_until_xmas} jours avant noël"
