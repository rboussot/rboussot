require_relative "task_book"
require_relative "router"
require_relative "controller"
require_relative "view"

task_book = TaskBook.new
controller = Controller.new(task_book)
router = Router.new(controller)

router.run
