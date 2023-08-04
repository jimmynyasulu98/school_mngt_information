class StudentGuardian < ApplicationRecord
  belongs_to :student
  belongs_to :guardian
  belongs_to :guardian_type
end
