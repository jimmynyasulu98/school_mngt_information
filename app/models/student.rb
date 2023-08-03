class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :guardian, through: :student_guardians
  has_one :form, through: :student_forms
  has_many :subjects, through: :student_subjects
  has_many :assessments

  def email_required?
    false
  end

end
