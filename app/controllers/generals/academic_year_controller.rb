class Generals::AcademicYearController < ApplicationController
  before_action :authenticate_staff!
  before_action :current_term, only: [:create]
  before_action :final_form, only: [:create]

  before_action :first_term, only: [:create]

  def new
    @academic_year = AcademicYear.new
    authorize  @academic_year
  end

  def create
    @current_term = current_term.id

    @academic_year = AcademicYear.new(academic_year_params)

    if @academic_year.valid?

      students = Student.all.joins(:student_forms).where(student_forms: {term_id: @current_term, registered: true}).joins(
        :forms).where(forms: {name: ...final_form})
      @academic_year.save

      @new_term = @academic_year.terms.build(term_number: 6,term_name_id: first_term ,start_date:params[:academic_year][:term][:start_date],
        end_date: params[:academic_year][:term][:end_date])
      @new_term.save

      students.each do |student|
        previous_form = student.student_forms.find_by(term_id: @current_term)
        @form = Form.find_by(name: previous_form.form.name) # Get form by name/title

        # make name filed in form a primary key to optimize query
        @student = student.student_forms.build(term_id: @new_term.id, form_id: Form.find_by(name: @form.name + 1).id)
        @student.save
      end

      ## add term details
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

  def final_form
    @class = Form.order(name: :asc).last.id
  end
  def first_term
    @term = TermName.order(title: :asc).first.id
  end

end
