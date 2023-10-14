class Assessments::StaffAssessmentsController < ApplicationController
  before_action :authenticate_staff!

  before_action :find_term


  def create
    @assessment_type =  AssessmentType.new(name:params[:assessment],term_id: @term.id,staff_id: current_staff.id)
    if @assessment_type.valid?
      @assessment_type.save

      # Check if the staff has the subject from a class asssigned to them
      @staff_subject = StaffSubject.find_by("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
                      current_staff.id,params[:subject_id], params[:form], @term.id)

      if !@staff_subject.nil?
        #create an assessment for the subjectpp
        @subject_assessment = SubjectAssessment.create(staff_subject_id: @staff_subject.id,assessment_type_id:
           @assessment_type.id )
        #Get students registered for this subject
        @student_subjects = StudentSubject.where("subject_id = ? AND form_id = ? AND term_id = ?",
            params[:subject_id], params[:form], @term.id)

        @student_subjects.each do |student|
          # Add students to assessments
          Assessment.create(student_id:student.student_id,term_id: @term.id,subject_id:params[:subject_id],form_id:params[:form],
            assessment_type_id:@assessment_type.id, staff_id: current_staff.id,subject_assessment_id:@subject_assessment.id)

        end
        redirect_back_or_to root_path,  notice: "Action completed successifully"

      else
        redirect_back_or_to root_path,  alert: "You do not have enough permissions"
      end

    else
      redirect_back_or_to root_path,  alert: @assessment_type.errors.objects.first.full_message
    end

  end

  def create_mandatory_assessment
    @mandatory_assessment =  AssessmentType.new(name:params[:assessment],term_id: @term.id,staff_id: current_staff.id,
       mandatory: :true,end_of_term: params[:end_of_term] )

    if @mandatory_assessment.valid?
      @mandatory_assessment.save

      @staff_subjects = StaffSubject.where(term: @term.id, core_teacher: true) #+++ assign core teacher
      @staff_subjects.each do |staff_subject|
        @subject_assessment = SubjectAssessment.create(staff_subject_id: staff_subject.id,assessment_type_id:
          @mandatory_assessment.id)

        @student_subjects = StudentSubject.where("subject_id = ? AND form_id = ? AND term_id = ?",
                      @subject_assessment.staff_subject.subject_id, @subject_assessment.staff_subject.form_id, @term.id)

        @student_subjects.each do |student|
          # Add students to assessments
          Assessment.create(student_id:student.student_id,term_id:@term.id,subject_id:@subject_assessment.staff_subject.
            subject_id, form_id:@subject_assessment.staff_subject.form_id, assessment_type_id: @mandatory_assessment.id,
            staff_id: current_staff.id, subject_assessment_id:@subject_assessment.id)
        end
      end
      redirect_back_or_to root_path ,notice: 'Action completed succefully'
    else
      redirect_back_or_to root_path,  alert: @assessment_type.errors.objects.first.full_message
    end

  end

  def mandatory_assessments
    @assessment_types = AssessmentType.where(mandatory: :true, released: :false, term_id: @term.id)
    @subjects = StaffSubject.where("staff_id = ? AND term_id = ?", current_staff.id , @term.id)
  end

  def assign_scores_to_students

    @staff_subject = StaffSubject.find_by("staff_id = ? AND subject_id = ? AND form_id = ? AND term_id = ?",
      current_staff.id,params[:subject_id], params[:form], @term.id)

    if !@staff_subject.nil?

      if params[:assessment] == "mandatory"
        #@subject_assessments = SubjectAssessment.joins(:assessment_types).where(term_id: @term.id, assessment_type:{mandatory: :true}, released: :false)
        @subject_assessments = SubjectAssessment.joins(:staff_subject).where(staff_subject: {subject_id: params[:subject_id],
          form_id:params[:form], term_id: @term.id}).joins(:assessment_type).where(assessment_type: { mandatory: true })
      else
        @subject_assessments = SubjectAssessment.joins(:staff_subject).where(staff_subject: {staff_id: current_staff.id,
          subject_id: params[:subject_id],form_id:params[:form], term_id: @term.id}).joins(:assessment_type).where(
          assessment_type: { mandatory: false })

      end

       @assessments = Assessment.where("subject_id = ? AND form_id = ? AND term_id = ?",
        params[:subject_id], params[:form], @term.id).order(score: :desc) #========= Join with subject_assessment

    else
      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

  def create_student_assessment_score

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

          # crucial subject results
          @crucial_subjects =  Assessment.where(student_id: params[:student_id] ,form_id: params[:form],
            term_id: params[:term],assessment_type_id: params[:assessment_type]).joins(:subject).where(
              subject: { compulsory: true, crucial: true })

          # student best subjects results excluding crucial
          @best_subjects_excluding_crucial_array = Assessment.where(student_id: params[:student_id] ,form_id:
            params[:form],term_id: params[:term],assessment_type_id: params[:assessment_type]).joins(:subject).where(
              subject:{crucial: false}).order(score: :desc).limit(6 - @crucial_subjects.count).collect { |u| if u.score then u.score else 0 end }
          @best_subjects_total = (@crucial_subjects.collect {|u| if u.score then u.score else 0 end } + @best_subjects_excluding_crucial_array).sum()

          @student_finale_result = StudentFinalResult.find_by(student_id:params[:student_id], term_id:@term.id)
          if @student_finale_result.nil? && @student_assessment.subject_assessment.assessment_type.mandatory?
            StudentFinalResult.create(student_id:params[:student_id],term_id: @term.id, form_id:params[:form],
              total_marks: params[:score].to_f,best_subjects_total: params[:score].to_f )

          elsif !@student_finale_result.nil? && @student_assessment.subject_assessment.assessment_type.mandatory?

            @student_finale_result.total_marks += params[:score].to_f
            @student_finale_result.best_subjects_total = @best_subjects_total

            if !@crucial_subjects.collect{ |u| if u.assessment_grade then u.assessment_grade.remark end}.include?(false) && @best_subjects_total > AssessmentGrade.select("end_mark").find_by(remark: false).end_mark * 6
              @student_finale_result.final_remark = true
            else
              @student_finale_result.final_remark = false
            end
            @student_finale_result.save
          end

          redirect_to  subject_assign_scores_to_student_path(subject_id:params[:subject_id],assessment: params[:assessment],
            form:params[:form],assessment_name: params[:assessment_name]) ,  notice:'Operation Successfull'
        else
          redirect_back_or_to root_path ,alert: 'Please Enter a valid Score'
        end
      else
        redirect_back_or_to root_path ,alert: 'Invalid details try again'
      end
    else

      redirect_back_or_to root_path,  alert: 'You do not have permissions'
    end
  end

  def submit_assessment
    begin
      subject_assessment = SubjectAssessment.find(params[:id])
      subject_assessment.submitted = true
      subject_assessment.save
      redirect_back_or_to root_path ,notice: 'Action completed succefully'

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path ,alert: 'Assessment not found'
    end


  end

  def destroy
    @assessment.destroy
    redirect_back_or_to root_path , notice: 'Action completed succefully'
  end

  private
  def find_assessment
    @assessment = AssessmentType.find(params[:id])

  end

  def find_term
    @term = Term.last
  end
end
