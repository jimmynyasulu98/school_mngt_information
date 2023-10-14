class TermName < ApplicationRecord
  validates :title, presence: true , uniqueness: true
end
