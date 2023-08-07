class Subjects::StaffSubjectsController < ApplicationController
  before_action :authenticate_staff!
  before_action :find_staff, only: [:new, :edit, :update, :destroy]

  def new
    @staff_subject = StaffSubject.new
    @term = Term.last

  end

  def create

    if StaffSubject.where("subject_id = ? AND form_id = ? AND term_id = ?", params[:subject_id],
      params[:form_id],params[:term_id]).nil?

      @staff_subject = StaffSubject.create(staff_subject_params)
      if @staff_subject.valid?
          redirect_back_or_to root_path,  notice: 'Subject assigned'
      else
        flash[:alert] = @staff_staff_subject.errors.objects.first.full_message
        render :new
      end
    else
      redirect_back_or_to root_path,  notice: 'Subject already assigned to another staff'
    end
  end

  private
    def find_staff # works without
      @staff = Staff.find(params[:staff_id])
    end

    def staff_subject_params
      # strong parameters
      params.require(:staff_subject).permit(:staff_id,:term_id,:subject_id, :form_id)
    end
end
