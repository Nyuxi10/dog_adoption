#require 'faker'
FactoryBot.define do 

  factory :pet do 
    name 'leia' 
    age 3
    gender 'female'
    breed 'normie'
    location 'hangryHouse'	
  end
end
