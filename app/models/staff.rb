class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :subjects, through: :staff_subjects
  has_many :assessments
  has_one :authorization

  def email_required?
    false
  end

end
