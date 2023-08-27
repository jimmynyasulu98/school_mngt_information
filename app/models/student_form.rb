class StudentForm < ApplicationRecord
  belongs_to :student
  belongs_to :form
  belongs_to :term
end
