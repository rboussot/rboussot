require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative "app/models/order"
require_relative "app/repositories/meals_repository"
require_relative "app/repositories/customers_repository"
require_relative "app/repositories/employees_repository"
require_relative "app/repositories/orders_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/orders_controller"
require_relative "router"

employees_repo = EmployeesRepository.new("data/employees.csv")
sessions_controller = SessionsController.new(employees_repo)
meals_repository = MealsRepository.new("data/meals.csv")
meals_controller = MealsController.new(meals_repository)
customers_repository = CustomersRepository.new("data/customers.csv")
customers_controller = CustomersController.new(customers_repository)
orders_repository = OrdersRepository.new("data/orders.csv", meals_repository, customers_repository, employees_repo)
orders_controller = OrdersController.new(orders_repository)
router = Router.new(sessions_controller, meals_controller, customers_controller, orders_controller)
router.run

# USER STORIES
# [X] As an employee, I can log in
# [X] As a manager, I can add a meal
# [X] As a manager, I can view all the meals
# [X] As a manager, I can add a customer
# [X] As a manager, I can view all the customers
# [X] As a manager, I can view all the undelivered orders
# [X] As a manager, I can add an order for a customer and assign it to a delivery guy
# [X] As a delivery guy, I can view my undelivered orders
# [ ] As a delivery guy, I can mark an order as delivered
