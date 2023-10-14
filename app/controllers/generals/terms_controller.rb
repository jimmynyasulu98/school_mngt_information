class Generals::TermsController < ApplicationController

  def new
    @term = Term.new
    @acadamic_year = AcademicYear.last
  end

  def create
    @term = Term.new(term_params)
    if @term.valid?
      @term.save
      redirect_to root_path, notice: 'Successfully added term'
    else
      flash[:alert] = @term.errors.objects.first.full_message
      render :new
    end
  end

  def term_params
    # strong parameters
      params.require(:term).permit(:term_number,:academic_year_id,:start_date, :end_date)
  end
  def current_term
    @term = Term.last
  end
end
