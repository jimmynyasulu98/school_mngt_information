class Subjects::SubjectsController < ApplicationController
  before_action :authenticate_staff!


  def create

    @subject = Subject.create(name: params[:name], compulsory: params[:compulsory])

    if @subject.valid?

      redirect_back_or_to root_path, notice: 'Operation successful'

    else
      redirect_back_or_to root_path , alert: @subject.errors.objects.first.full_message
    end

  end

  def add_subject_to_class
    @subjects =  Subject.all
  end

  def create_class_subject

    noneEmptySubjects =  params[:subjects].reject { |c| c.empty? } # reject empty elements
    for subject in noneEmptySubjects  do
      # Assign subject if not already registered on the subject
      if !FormSubject.exists?(form_id: params[:form], subject_id:subject)
        # Assign if subject exist
        FormSubject.create(form_id: params[:form], subject_id:subject) if Subject.exists?(id: subject)
      else
        redirect_back_or_to root_path , alert: "Subject already added to class"
        return
      end
    end

    redirect_back_or_to root_path , notice: "Operation is successful"

  end


end
