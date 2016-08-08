require "csv"
require_relative "../models/customer"

class CustomersRepository
  attr_reader :customers
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    load_csv
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_to_csv
  end

  def find(customer_id)
    @customers.find { |customer| customer.id == customer_id }
  end

  private

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << [ "id", "name", "address" ]
      @customers.each do |customer|
        csv << [ customer.id, customer.name, customer.address ]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @customers << Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address])
    end
    @next_id = @customers.empty? ? 1 : (@customers.last.id + 1)
  end
end
