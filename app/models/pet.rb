

#  name age integer gender photo breed and location

class  Pet < ApplicationRecord
  validates :name, :age, :gender, :breed, :location, presence: true
  validates_numericality_of :age, only_integer: true
end
