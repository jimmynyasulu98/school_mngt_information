class StaffSubject < ApplicationRecord
  belongs_to :staff
  belongs_to :subject
  belongs_to :term
  belongs_to :form
  has_many :subject_assessments
end
