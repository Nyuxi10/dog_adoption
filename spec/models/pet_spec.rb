
require 'rails_helper'
#clear
# name age gender photo breed and location
RSpec.describe Pet, type: :model do	
  context 'validation tests' do
  	subject {
  		described_class.new(name: "leia", age: 3, gender: "female", breed: "normie", location: "calle2 #3-1")
  	}

    it "is valid with valid atributes" do
      expect(subject).to be_valid
    end


    it "no valid without name" do
    	subject.name = nil
    	expect(subject).to_not be_valid
    end

    it "no valid without age" do
    	subject.age = nil
    	expect(subject).to_not be_valid
    end

    it "is no valid without gender" do
      subject.gender = nil
      expect(subject).to_not be_valid
    end

    it "no valid without breed" do
    	subject.breed = nil
    	expect(subject).to_not be_valid
    end

    it "no valid without location" do
    	subject.location = nil
    	expect(subject).to_not be_valid

    end

    context "age debe ser numero entero" do
      it 'age validation' do
      	expect(subject).to be_valid
        expect(subject.age.class).to eq(Integer)
      end
    end

    

  end
 

end








=begin
	
rescue describe '#age' do
    it {is_expected.to  validate_presence_of(:age)}
    end => e
	
end

=end 