class Restaurant
  attr_reader :name

  def initialize(name, city, chief_name, years)
    @name = name
    @city = city
    @clients = []
    @chief = Chief.new(chief_name, years, self)
  end

  def add_reservation(clients)
    @clients << client
  end

  # Ici c'est une méthode de classe pas une méthode d'instance !
  def self.price_for(category)
    case category
    when "Italian"
      "25"
    when "French"
      "12"
    end
  end
end

# # ====== Fichier fastfood.rb avec un require_relative "restaurant" ======
# class FastFood < Restaurant
#   attr_reader :name, :clients
#   def initialize(name, city, prep_time)
#     super name, city
#     @prep_time = prep_time
#     @clients = []
#   end
# end

# # ====== Fichier starrestaurant.rb avec un require_relative "restaurant" ======
# class StarRestaurant < Restaurant
#   def initialize(name, city, stars)
#     super name, citysuper
#     @stars = stars
#     @clients = []
#   end

#   def clients
#     return "You don't have access to #{name}"
#   end
# end

# Une classe différente

class Chief
  attr_accessor :name, :years, :restaurant
  def initialize(name, years, restaurant)
    @name = name
    @years = years
    @restaurant = restaurant
  end
end


# pny = FastFood.new("PNY", "Paris", 10)
# puts pny.name
# pny.add_reservation("Boris")
# puts pny.clients

# tour_d_argent = StarRestaurant.new("La Tour d'Argent", "Paris", 15)
# puts tour_d_argent

puts Restaurant.price_for("Italian")

mama = Restaurant.new("Mama Roma", "Paris", "Luigi", 7)
luigi = mama.chief
puts luigi


