class CustomersView
  def ask_for(info)
    puts "#{info}?"
    print ">"
    gets.chomp
  end

  def list(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name}"
    end
  end
end
