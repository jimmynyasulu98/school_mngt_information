class Assessments::StaffAssessmentsController < ApplicationController

  def new
    @term = Term.last
    if !StaffSubject.where("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id).take.nil?

       @student_subjects = StudentSubject.where("subject_id = ? AND form_id = ? AND term_id = ?",
        params[:subject_id], params[:form], @term.id)

    else
      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

  def create
  end

end
