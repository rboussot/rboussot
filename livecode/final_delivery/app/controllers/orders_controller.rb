require_relative '../views/orders_view'

class OrdersController
  def initialize(orders_repository)
    @orders_repository = orders_repository
    @meals_repository = orders_repository.meals_repository
    @customers_repository = orders_repository.customers_repository
    @employees_repository = orders_repository.employees_repository
    @view = OrdersView.new
  end

  def create
    @view.list_items(@meals_repository.meals)
    meal_id = @view.ask_for("Meal number")
    @view.list_items(@customers_repository.customers)
    customer_id = @view.ask_for("Customer number")
    @view.list_items(@employees_repository.delivery_guys)
    employee_id = @view.ask_for("Employee number")
    meal = @meals_repository.find(meal_id)
    customer = @customers_repository.find(customer_id)
    employee = @employees_repository.find(employee_id)
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @orders_repository.add(order)
  end

  def list_undelivered
    @view.list_orders(@orders_repository.undelivered_orders)
  end

  def list_undelivered_delivery_guy(employee)
    @view.list_orders(@orders_repository.undelivered_orders.select { |order| order.employee == employee })
  end

  def mark_as_delivered(employee)
    list_undelivered_delivery_guy(employee)
    order_id = @view.ask_for("Order delivered")
    @orders_repository.update(order_id)
  end
end
