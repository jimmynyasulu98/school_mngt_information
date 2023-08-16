class Assessments::StaffAssessmentsController < ApplicationController
  before_action :authenticate_staff!

  def new
    @term = Term.last
    @assessment_types = AssessmentType.where(staff_id: current_staff.id)
    @staff_subject = StaffSubject.where("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id)

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

    if !@staff_subject.nil?

      @student_assessment = Assessment.where(student_id: params[:student_id],subject_id: params[:subject_id],
        form_id: params[:form],term_id: params[:term],assessment_type_id: params[:assessment_type]).first

      if !@student_assessment.nil?
        assessment_grade = nil
        for grade in AssessmentGrade.all
          if Array(grade.start_mark.to_i..grade.end_mark.to_i).include?(params[:score].to_i)
            assessment_grade = grade.id
            break
          end
        end
        if !assessment_grade.nil?
          @student_assessment.score = params[:score].to_f
          @student_assessment.assessment_grade_id = assessment_grade
          @student_assessment.save
          redirect_back_or_to root_path,  notice: 'Operation Successfull'
        else
          redirect_back_or_to root_path,  alert: 'Please Enter a valid Score'
        end
      end
    else

      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

end
