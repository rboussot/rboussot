require 'io/console'

class SessionsView
  def ask_for_info(info)
    puts "#{info.capitalize}?"
    print ">"
    if info == "password"
      STDIN.noecho(&:gets).chomp
    else
      gets.chomp
    end
  end

  def display_error_message
    puts "Wrong username or password, try again ..."
  end
end
