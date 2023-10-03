class AssessmentType < ApplicationRecord
  validates :name, presence: true
  has_many :assessments, dependent: :destroy
  has_many :subject_assessments, dependent: :destroy
end
