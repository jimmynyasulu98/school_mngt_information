class Students::HomesController < ApplicationController

  before_action :authenticate_student!
  before_action :current_term, only: [:subjects, :select_subjects, :register_subjects, :assessments, :exam_results,
    :student_form]
  before_action :student_form, only: [:exam_results]
  before_action :current_academic_year, only: [:register_subjects]

  def index
  end

  def subjects
    @student_subjects = StudentSubject.where(student_id: current_student.id, term_id: @term.id)
    @student_form =  StudentForm.where(student_id: current_student.id , term_id: @term.id).first
  end

  def select_subjects
    @student_form = StudentForm.where(student_id: current_student.id).joins(:term).where(term: {academic_year_id:current_academic_year.id}).first
    @student_subjects = StudentSubject.where(student_id: current_student.id, term_id: @term.id)
    @subjects = FormSubject.where(form_id: @student_form.form_id )

    @subjects_hash = Hash.new
    @subjects.each do |subject|
      @subjects_hash[subject.subject_id] = subject.subject.name
    end

  end

  def register_subjects

    @student_form = StudentForm.where(student_id: current_student.id).joins(:term).where(term:
      {academic_year_id:current_academic_year.id}).first
    if !@student_form.nil?
      noneEmptySubjects =  params[:subjects].reject { |c| c.empty? } # reject empty elements
      for subject in noneEmptySubjects  do
        # Assign subject if not already registered on the subject
        if !StudentSubject.exists?(student_id: current_student.id,term_id: @term.id, subject_id:subject)
          StudentSubject.create(student_id: current_student.id,subject_id:subject,term_id: @term.id,
            form_id: @student_form.form_id) if Subject.exists?(id: subject) # Assign if subject exist
        else
          redirect_back_or_to root_path , alert: "You already have registered for the specified subject(s)"
          return
        end
      end
      redirect_back_or_to root_path , notice: "Operation is successiful"

    else

    end
  end

  def assessments
    @assessments = Assessment.where(student_id: current_student.id , term_id: @term.id)
  end

  def exam_results
    @assessment_type = AssessmentType.where(mandatory: true).last.id
    @exam_results = Assessment.where(student_id: current_student.id, term_id: @term.id, assessment_type_id:@assessment_type)
    @final_result = StudentFinalResult.where(assessment_type_id:@assessment_type, form_id: student_form.form_id).order(best_subjects_total: :desc)
  end

  private

  def current_term
    @term = Term.last
  end

  def current_academic_year
    @term = AcademicYear.last
  end

  def student_form
    @student_form = StudentForm.find_by(student_id: current_student.id, term_id: current_term.id)
  end

end
