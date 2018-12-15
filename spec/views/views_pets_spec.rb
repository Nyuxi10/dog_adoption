#holi babosa
require 'rails_helper'

RSpec.describe 'views/index.html.haml', :type => :view do;
 visit pets_path
 click_link "Editar"
 expect(current_path).to eq(edit_pet_path(pet))
  fill_in "Nombre", with: "name.example"
  fill_in "Edad", with: "edad.example"
  fill_in "Genero", with: "Genero.example"
  fill_in "Raza", with: "Raza.example"
  fill_in "Localizacion", with: "Localizacion.example"
  click_button "Update"
end
