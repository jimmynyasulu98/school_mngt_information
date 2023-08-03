class AcademicYear < ApplicationRecord
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :terms
  has_many :students, through: :student_forms

end
