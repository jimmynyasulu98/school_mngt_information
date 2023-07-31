class Staffs::RegistrationsController < ApplicationController
  def new
    @staff = Staff.new
  end

  def create

    @staff = Staff.new(user_params)

    if @staff.save

        redirect_to root_path, notice: 'Successfully Registered Staff Member'
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
