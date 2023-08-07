class Staffs::RegistrationsController < ApplicationController
  before_action :authenticate_staff!

  def index

    if !params[:filter].blank?
      @staff = Staff.where("username  LIKE ?", "%#{params[:filter]}%")
    else
      @staff = Staff.all
    end

  end

  def new
    @staff = Staff.new
  end

  def create

    @staff = Staff.new(user_params)
    @staff.password = 123456789.to_s
    if @staff.save
        redirect_to root_path, notice: 'Successfully Registered Staff Member'
    else
        flash[:alert] = @staff.errors.objects.first.full_message
        render :new
    end
  end

  private
    def user_params
    # strong parameters
    params.require(:staff).permit(:email,:username,:email, :first_name,:middle_name, :surname, :date_of_bith, :date_of_appointment,
    :phone_number , :gender)
    end
end
