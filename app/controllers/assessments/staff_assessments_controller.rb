class Assessments::StaffAssessmentsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @term = Term.last
    @assessment_types = AssessmentType.where(staff_id: current_staff.id)
    @staff_subject = StaffSubject.where("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id).take

    if !@staff_subject.nil?

       @assessments = Assessment.where("subject_id = ? AND form_id = ? AND term_id = ?",
        params[:subject_id], params[:form], @term.id)

    else
      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

  def create
    @term = Term.last
    @staff_subject = StaffSubject.where("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id)

    puts @staff_subject ,current_staff.id

    puts params
    if !@staff_subject.nil?
      puts "okay2"
      @student_subjects = StudentSubject.where("subject_id = ? AND form_id = ? AND term_id = ?",
        params[:subject_id], params[:form], @term.id)


    else

      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

end
