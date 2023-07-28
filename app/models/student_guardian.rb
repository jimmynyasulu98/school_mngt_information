class StudentGuardian < ApplicationRecord
  belongs_to :Student
  belongs_to :Guardian
  belongs_to :GuardianType
end
