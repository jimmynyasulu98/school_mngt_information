class Subject < ApplicationRecord
  validates :name, presence: true , unique: true

end
