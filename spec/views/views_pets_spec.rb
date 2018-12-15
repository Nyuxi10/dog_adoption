#holi babosa
require 'rails_helper'

RSpec.describe 'views/index.html.haml', :type => :view do;
 context 'when the button has de url' do
     it 'display' do
         assign(:pet, build(asssing :pet, url: 'http://localhost:3000/pets/4')
      render
      expect(rendered).to have_link 'Mostrar', href: 'http://localhost:3000/pets/4'
    end
  end
