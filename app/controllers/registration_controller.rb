class RegistrationController < ApplicationController
  def new
    @staff = Staff.new
  end

  def create

    @staff = Staff.new(user_params)

    if @staff.sav
    # stores saved user id in a session
        session[:staff_id] = @staff.id
        redirect_to root_path, notice: 'Successfully created account'
    else
        render :new
    end
  end

  private
    def user_params
    # strong parameters
    params.require(:staff).permit(:email,:username, :password, :password_confirmation)
    end
end
