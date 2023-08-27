class ApplicationController < ActionController::Base
  include Pundit::Authorization

  add_flash_types :info, :error, :success


end
