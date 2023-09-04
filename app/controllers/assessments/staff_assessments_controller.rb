class Assessments::StaffAssessmentsController < ApplicationController
  before_action :authenticate_staff!
  before_action :find_assessment, only: [:submit_assessment, :destroy]


  def create
    @term = Term.last
    @assessment_type =  AssessmentType.new(name:params[:assessment],term_id: @term.id,staff_id: current_staff.id)
    if @assessment_type.valid?
      @assessment_type.save

      # Check if the staff has the subject from a class asssigned to them
      @staff_subject = StaffSubject.find_by("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
                      current_staff.id,params[:subject_id], params[:form], @term.id)

      if !@staff_subject.nil?
        @student_subjects = StudentSubject.where("subject_id = ? AND form_id = ? AND term_id = ?",
            params[:subject_id], params[:form], @term.id)

        @student_subjects.each do |student|

          Assessment.create(student_id:student.student_id,term_id: @term.id,subject_id:params[:subject_id],
            form_id:params[:form], assessment_type_id: @assessment_type.id, staff_id: current_staff.id)
        end
        redirect_back_or_to root_path,  notice: "Action completed successifully"
      else
        redirect_back_or_to root_path,  alert: "You do not have enough permissions"
      end

    else
      redirect_back_or_to root_path,  alert: @assessment_type.errors.objects.first.full_message
    end

  end

  def assign_scores_to_students
    @term = Term.last
    @assessment_types = AssessmentType.where(staff_id: current_staff.id)
    @staff_subject = StaffSubject.find_by("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id)

    if !@staff_subject.nil?

       @assessments = Assessment.where("subject_id = ? AND form_id = ? AND term_id = ?",
        params[:subject_id], params[:form], @term.id).order(score: :desc)

    else
      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

  def create_student_assessment_score
    @term = Term.last
    @staff_subject = StaffSubject.find_by("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id)

    if !@staff_subject.nil?

      @student_assessment = Assessment.find_by(student_id: params[:student_id],subject_id: params[:subject_id],
        form_id: params[:form],term_id: params[:term],assessment_type_id: params[:assessment_type])

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

          redirect_to  subject_assign_scores_to_student_path(subject_id:params[:subject_id] , form:params[:form],
            assessment_name: params[:assessment_name]) ,  notice:'Operation Successfull'
        else
          redirect_back_or_to root_path ,alert: 'Please Enter a valid Score'
        end
      end
    else

      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

  def submit_assessment
    @assessment.submitted = true
    @assessment.save
    redirect_back_or_to root_path ,notice: 'Action completed succefully'

  end

  def destroy
    @assessment.destroy
    redirect_back_or_to root_path ,notice: 'Action completed succefully'
  end

  private
  def find_assessment
    @assessment = AssessmentType.find(params[:id])
  end
end
