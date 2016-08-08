class Router

  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      gets_choice
      choice = gets.chomp.to_i
      dispatch_choice(choice)
    end
  end

  private

  def gets_choice
    puts "What do you want to do ?"
    puts "1. New task"
    puts "2. Edit task"
    puts "3. Find task"
    puts "4. Mark task as done"
    puts "Any key to quit"
  end

  def dispatch_choice(choice)
    case choice
      when 1 then @controller.add_task
      when 2 then puts "OK"
      when 3 then puts "OK"
      when 4 then puts "OK"
      else exit
    end
  end
end
