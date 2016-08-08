require_relative '../views/customers_view'

class CustomersController
  def initialize(customers_repository)
    @view = CustomersView.new
    @customers_repository = customers_repository
  end

  def create
    name = @view.ask_for("Customer name")
    address = @view.ask_for("Address")
    customer = Customer.new(name: name, address: address)
    @customers_repository.add(customer)
  end

  def list
    @view.list(@customers_repository.customers)
  end
end
