class MealsView
  def ask_for(info)
    puts "#{info}?"
    print ">"
    gets.chomp
  end

  def list(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name}: #{meal.price}$"
    end
  end
end
