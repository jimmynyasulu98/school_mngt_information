class AcademicYearPolicy < ApplicationPolicy

  attr_reader :staff, :academic_year

  def initialize(staff, academic_year)
    @staff = staff
    @academic_year = academic_year
  end

  def new?
    staff.authorization.staff_auths?
  end



end
