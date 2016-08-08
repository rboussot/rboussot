class Router
  def initialize(sessions_controller, meals_controller, customers_controller, orders_controller)
    @sessions_controller = sessions_controller
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @orders_controller = orders_controller
  end

  def run
    puts "-" * 30
    puts "WELCOME TO LE WAGON RESTAURANT"
    # login for employee
    @employee = @sessions_controller.sign_in
    # loop on menu
    while @employee
      # display menu towards employee status
      if @employee.manager
        display_menu_for_manager
        action = gets.chomp.to_i
        route_action_manager(action)
      else
        display_menu_for_delivery_guy
        action = gets.chomp.to_i
        route_action_delivery_guy(action)
      end
    end
  end

  private

  def display_menu_for_manager
    puts ""
    puts "What do you want to do next?"
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Create an order"
    puts "6 - List undelivered order"
    puts "7 - Sign out"
    puts "8 - Stop and exit the program"
    print "> "
  end

  def display_menu_for_delivery_guy
    puts ""
    puts "What do you want to do next?"
    puts "1 - List undelivered orders"
    puts "2 - Mark an order as delivered"
    puts "3 - Sign out"
    puts "4 - Stop and exit the program"
    print "> "
  end

  def route_action_manager(action)
    case action
    when 1 then @meals_controller.create
    when 2 then @meals_controller.list
    when 3 then @customers_controller.create
    when 4 then @customers_controller.list
    when 5 then @orders_controller.create
    when 6 then @orders_controller.list_undelivered
    when 7 then sign_out!
    when 8 then stop!
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 7 or 8"
    end
  end

  def route_action_delivery_guy(action)
    case action
    when 1 then @orders_controller.list_undelivered_delivery_guy(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 3 then sign_out!
    when 4 then stop!
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def sign_out!
    @employee = @sessions_controller.sign_in
  end

  def stop!
    @employee = nil
  end
end
