class Term < ApplicationRecord
  belongs_to :academic_year
  validates :term_number, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :students, through: :student_forms
end
