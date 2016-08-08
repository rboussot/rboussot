class Room
  attr_accessor :id

  def initialize(attributes = {})
    capacity = attributes[:capacity]
    patients = []
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    if full?
      fail NameOfError "Room is full"
      # Attention avec une exception on sort du programme.
      # On peut éviter l'erreur au moment de l'exécution grâce à begin/rescue.
      # begin
      # room.add_patient(george)
      # rescue Room::NameOfError => e
      #   puts e.message
      #   puts "Oop room is full"
      # end
    else
      @patients << patient
      patient.room = self
      # Car le patient peut être n'importe quelle instance de patient.
    end
  end
end
