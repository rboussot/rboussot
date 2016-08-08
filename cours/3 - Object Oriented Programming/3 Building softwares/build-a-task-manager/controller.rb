require_relative "view"

class Controller

  def initialize(task_book)
    @view = View.new
    @task_book = task_book
  end

  def fetch_all
    puts "No task for the moment"
  end

  def add_task
    attributes = @view.ask_new
    @task = Task.new(attributes)
  end

  def remove_task
  end

  def mark_as_done
  end
end
