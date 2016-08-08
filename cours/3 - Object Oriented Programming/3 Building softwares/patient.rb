class Patient
  attr_accessor :room
  attr_accessor :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end
end
