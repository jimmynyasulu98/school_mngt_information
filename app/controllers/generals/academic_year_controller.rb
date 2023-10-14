class Generals::AcademicYearController < ApplicationController
  before_action :authenticate_staff!
  before_action :current_term, only: [:create]


  def new
    @academic_year = AcademicYear.new
    authorize  @academic_year
  end

  def create
    @academic_year = AcademicYear.new(academic_year_params)

    if @academic_year.valid?
      puts params
      puts Student.all.joins(:student_forms).where(student_forms: {term_id: Term.last.id, registered: true})

      ## add term details
      ## add student form details
      #add student to registrations
      redirect_to root_path, notice: 'Successfully added academic calender'
    else
      flash[:alert] = @academic_year.errors.objects.first.full_message
      render :new
    end
  end

  private
  def academic_year_params
  # strong parameters
    params.require(:academic_year).permit(:name,:start_date, :end_date)
  end

  def current_term
    @term = Term.last
  end

  def pundit_user
    current_staff
  end

end
