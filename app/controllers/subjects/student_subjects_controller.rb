class Subjects::StudentSubjectsController < ApplicationController

  before_action :authenticate_staff!

  def create

    term = Term.last
    puts "okay okay"
    @student_form =  StudentForm.where(student_id: params[:student_id] , academic_year_id: term.academic_year_id).first
    if !@student_form.nil?
      noneEmptySubjects =  params[:subjects].reject { |c| c.empty? } # reject empty elements
      for subject in noneEmptySubjects  do
        # Assign subject if not already registered on the subject
        if !StudentSubject.exists?(student_id: params[:student_id],term_id: term.id, subject_id:subject)

          StudentSubject.create(student_id: params[:student_id],subject_id:subject,term_id: term.id,
            form_id: @student_form.form_id) if Subject.exists?(id: subject) # Assign if subject exist

        else
          redirect_back_or_to root_path , alert: "Student already registered for the specified subject(s)"
          break
        end
      end
    else

    end
  end

end
