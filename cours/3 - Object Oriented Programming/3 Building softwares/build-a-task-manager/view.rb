require_relative 'task'

class View
  def print_list
  end

  def ask_new
    puts "Please create a task :"
    name = gets.chomp
    puts "Please enter a description of the task :"
    description = gets.chomp
    Task.new(name, description)
  end

  def ask_remove
  end

  def ask_done
  end
end
