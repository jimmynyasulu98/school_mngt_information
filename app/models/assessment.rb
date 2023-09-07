class Assessment < ApplicationRecord
  belongs_to :student
  belongs_to :staff
  belongs_to :assessment_type
  belongs_to :form
  belongs_to :term
  belongs_to :assessment_grade
end
