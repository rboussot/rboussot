class OrdersView
  def list_items(items)
    items.each do |item|
      puts "#{item.id}. #{item.name}"
    end
  end

  def list_orders(orders)
    puts "Undelivered orders"
    orders.each do |order|
      puts "#{order.id}. #{order.meal.name} to #{order.customer.name} by #{order.employee.name}"
    end
  end

  def ask_for(id)
    puts "#{id}?"
    print ">"
    gets.chomp.to_i
  end
end
