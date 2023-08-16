class Students::RegistrationsController < ApplicationController

  before_action :find_student, only: [:show, :edit, :destroy]

  def new
    @student = Student.new
  end

  def create

    @student = Student.new(user_params)
    @student.password = 123456789.to_s

    if @student.save
      # Add a student in a Student class/form  table for the current acadamic year
      StudentForm.create(student_id: @student.id, form_id: params[:form_id], academic_year_id: AcademicYear.last.id)
      redirect_to  student_path(@student.id), notice: 'Successfully Registered student'
      #new_student_guardian
    else
      flash[:alert] = @student.errors.objects.first.full_message
      render :new
    end
  end

  def show
    @subjects = Subject.all
    @student_form =  StudentForm.where(student_id: @student.id , academic_year_id: AcademicYear.last.id).first
  end

  private
    def user_params
    # strong parameters
    params.require(:student).permit(:email,:username, :first_name,:middle_name, :surname, :date_of_bith, :date_of_enrollment,
    :phone_number, :gender,:district, :TA, :village)
    end

    def find_student
      @student = Student.find(params[:id])
    end
end
