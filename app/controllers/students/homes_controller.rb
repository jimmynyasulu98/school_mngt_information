class Students::HomesController < ApplicationController
  before_action :current_term, only: [:subjects, :select_subjects, :register_subjects, :assessments]

  def index
  end

  def subjects

    @student_subjects = StudentSubject.where(student_id: current_student.id, term_id: @term.id)
    @student_form =  StudentForm.where(student_id: current_student.id , term_id: @term.id).first
  end

  def select_subjects
    @subjects = Subject.all
    @student_subjects = StudentSubject.where(student_id: current_student.id, term_id: @term.id)
    @student_form =  StudentForm.where(student_id: current_student.id , term_id: @term.id).first
  end

  def register_subjects
    @student_form =  StudentForm.where(student_id: current_student.id , term_id: @term.id).first

    if !@student_form.nil?
      noneEmptySubjects =  params[:subjects].reject { |c| c.empty? } # reject empty elements

      for subject in noneEmptySubjects  do
        # Assign subject if not already registered on the subject
        if !StudentSubject.exists?(student_id: current_student.id,term_id: @term.id, subject_id:subject)

          StudentSubject.create(student_id: current_student.id,subject_id:subject,term_id: @term.id,
            form_id: @student_form.form_id) if Subject.exists?(id: subject) # Assign if subject exist


        else
          redirect_back_or_to root_path , alert: "You already have registered for the specified subject(s)"
          break
        end
      end
      redirect_back_or_to root_path , notice: "Operation is successiful"
    else

    end
  end

  def assessments
    @assessments = Assessment.where(student_id: current_student.id , term_id: @term.id)
    puts current_student.id
    puts @term.id
  end

  def results
  end

  private

  def current_term
    @term = Term.last
  end

end
