class Restaurant
  attr_reader :name
  attr_accessor :capacity

  def initialize(name, category, capacity, city = "Paris")
  # Par défaut Paris, mais on laisse le choix à l'utilisateur lors de la création.
    @name = name
    @category = category
    @capacity = capacity
    @city = city
    @clients = []
  end

  def add_reservation(client)
    @clients << clientend
  end

  def open?
    Time.now.hour >= 12 && Time.now.hour <= 14
  end

  def closed?
    !open?
  end

  tchai = Restaurant.new("Esprit Tchai", "zen", 6, "Paris")
  puts tchai.nametchai.capacity = 8
  tchai.add_reservation("Boris")
  tchai.add_reservation("Romain")
  puts tchai.clients
end
