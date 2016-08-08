require "csv"
require_relative "../models/meal"

class MealsRepository
  attr_reader :meals
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    load_csv
  end

  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_to_csv
  end

  def find(meal_id)
    @meals.find { |meal| meal.id == meal_id }
  end

  private

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << [ "id", "name", "price" ]
      @meals.each do |meal|
        csv << [ meal.id, meal.name, meal.price ]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @meals << Meal.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_i)
    end
    @next_id = @meals.empty? ? 1 : (@meals.last.id + 1)
  end
end
