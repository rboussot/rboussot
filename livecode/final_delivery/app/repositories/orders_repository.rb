require "csv"
require_relative "../models/order"

class OrdersRepository
  attr_reader :meals_repository, :customers_repository, :employees_repository
  def initialize(csv_file, meals_repository, customers_repository, employees_repository)
    @csv_file = csv_file
    @orders = []
    @meals_repository = meals_repository
    @customers_repository = customers_repository
    @employees_repository = employees_repository
    load_csv
  end

  def add(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_to_csv
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered }
  end

  def update(order_id)
    delivered_order = @orders.find { |order| order.id == order_id }
    delivered_order.mark_as_delivered!
    save_to_csv
  end

  private

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << [ "id", "meal_id", "employee_id", "customer_id", "delivered" ]
      @orders.each do |order|
        csv << [ order.id, order.meal.id, order.employee.id, order.customer.id, order.delivered ]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      meal = @meals_repository.find(row[:meal_id].to_i)
      employee = @employees_repository.find(row[:employee_id].to_i)
      customer = @customers_repository.find(row[:customer_id].to_i)
      @orders << Order.new(id: row[:id].to_i, meal: meal, employee: employee, customer: customer, delivered: (row[:delivered] == "true"))
    end
    @next_id = @orders.empty? ? 1 : (@orders.last.id + 1)
  end
end
