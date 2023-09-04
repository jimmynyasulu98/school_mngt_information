class AssessmentType < ApplicationRecord
  validates :name, presence: true
  has_many :assessments, dependent: :destroy
end
