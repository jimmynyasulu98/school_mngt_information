class Generals::SubjectsController < ApplicationController

  def create

    @subject = Subject.create(name: params[:name], compulsory: params[:compulsory])

    if @subject.valid?

      redirect_back_or_to root_path, notice: 'Operation successful'

    else
      redirect_back_or_to root_path , alert: @subject.errors.objects.first.full_message
    end

  end

end
