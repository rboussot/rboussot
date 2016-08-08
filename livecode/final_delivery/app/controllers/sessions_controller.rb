require_relative "../views/sessions_view"

class SessionsController
  def initialize(employees_repo)
    @view = SessionsView.new
    @employees_repo = employees_repo
  end

  def sign_in
    #   ask for username
    username = @view.ask_for_info("username")
    #   ask for password
    pwd = @view.ask_for_info("password")
    #   match with employees
    employee = @employees_repo.find_by_username(username)
    if employee && employee.password == pwd
      return employee
    else
      @view.display_error_message
      sign_in
    end
  end
end
