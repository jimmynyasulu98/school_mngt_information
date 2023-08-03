class Guardian < ApplicationRecord
  has_many :students, through: :student_guardians
end
