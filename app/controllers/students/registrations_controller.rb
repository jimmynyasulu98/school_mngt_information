class Students::RegistrationsController < ApplicationController

  def new
    @student = Student.new
  end

  def create

    @student = Student.new(user_params)
    @student.password = 123456789.to_s

    if @student.save
        params[:student_id] = @student.id

        redirect_to new_student_guardian_path(@student.id), notice: 'Successfully Registered student Member'
    else
        render :new
    end
  end

  private
    def user_params
    # strong parameters
    params.require(:student).permit(:email,:email,:username, :first_name,:middle_name, :surname, :date_of_bith, :date_of_enrollment,
    :phone_number, :gender,:district, :TA, :village)
    end
end
