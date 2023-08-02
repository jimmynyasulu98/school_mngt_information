class Generals::AcademicYearController < ApplicationController
  def new
    @academic_year = AcademicYear.new
  end

  def create

    @academic_year = AcademicYear.new(academic_year_params)

    if @academic_year.valid?
      @academic_year.save
      redirect_to root_path, notice: 'Successfully added acadamic calender'
    else
      flash[:alert] = @academic_year.errors.objects.first.full_message
      render :new
    end
  end

  private
  def academic_year_params
  # strong parameters
    params.require(:academic_year).permit(:name,:start_date, :end_date)
  end

end
