class Generals::GuardiansController < ApplicationController

  def new
    @guardian = Guardian.new
  end

  def create
    @guardian = Guardian.create(user_params)

    if @guardian.valid?
      @guardian.save
      StudentGuardian.create(student_id: params[:student_id], guardian_id: 1 , guardian_type_id: 1)
      redirect_to root_path, notice: 'Operation successful'

    else
      render new
    end

  end
  private
    def user_params
    # strong parameters
    params.require(:guardian).permit(:first_name,:middle_name, :surname, :date_of_bith,:email,:phone_number, :gender,
      :district, :TA, :village)
    end

end
