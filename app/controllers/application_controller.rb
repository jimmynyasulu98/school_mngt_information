class ApplicationController < ActionController::Base
  include Pundit::Authorization

  add_flash_types :info, :error, :success

  def current_user
    current_staff || current_student
  end
end
