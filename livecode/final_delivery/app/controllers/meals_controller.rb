require_relative '../views/meals_view'

class MealsController
  def initialize(meals_repository)
    @view = MealsView.new
    @meals_repository = meals_repository
  end

  def create
    name = @view.ask_for("Meal name")
    price = @view.ask_for("Price")
    meal = Meal.new(name: name, price: price)
    @meals_repository.add(meal)
  end

  def list
    @view.list(@meals_repository.meals)
  end
end
