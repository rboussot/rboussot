require "csv"
require_relative "../models/employee"

class EmployeesRepository
  attr_reader :employees
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv
  end

  def find(employee_id)
    @employees.find { |employee| employee.id == employee_id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.name == username }
  end

  def all
    @employees
  end

  def delivery_guys
    @employees.reject { |employee| employee.manager }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:manager] = row[:manager] == "true"
      @employees << Employee.new(row)
    end
  end
end
