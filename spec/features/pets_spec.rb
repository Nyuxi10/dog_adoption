require 'rails_helper'

RSpec.describe 'pets features', :type => :feature do
  describe 'viewing the index' do
  #All the expected elements are present and say the right thing?
    it 'list all pets' do 
      create(:pet)
      visit pets_path

      expect(page).to have_content( 'leia')
    end
  end
  

  describe 'There are not pets' do
    it 'Should list any pet' do 
      visit pets_path

      expect(page).to_not have_content('leia')
    end
  end
end
