class StaffSalary < ApplicationRecord
  belongs_to :staff
  belongs_to :grade
end
