class Subject < ApplicationRecord
  validates :name, presence: true , uniqueness: { scope: :name }

end
