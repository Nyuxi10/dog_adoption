

#  name age integer gender photo breed and location

class  Pet < ApplicationRecord
	validates :name, presence: true 
	validates :age, presence:true
	validates :gender, presence:true
	validates :breed, presence:true
	validates :location, presence:true
    validates_numericality_of :age, only_integer: true
end