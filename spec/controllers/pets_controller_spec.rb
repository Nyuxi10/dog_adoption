
# name age gender photo breed and location
# probar la rederizacion de las vistas
require 'rails_helper'
  RSpec.describe PetsController, :type => :controller do


  describe 'GET #index' do
    it "renders the :index template" do
      pet = FactoryBot.create(:pet)
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :index
      expect(assigns(:pets)).to eq([pet])
    end
  end

  describe 'Get #show' do
    it 'render show' do 
      pet = FactoryBot.create (:pet)
      get :show, params: {id: pet.id}
      expect(response).to have_http_status(:ok)
      expect(response).to render_template :show
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe 'GET #edit' do
    it 'render edit' do 
      pet = FactoryBot.create (:pet)  
      get :edit, params: {id: pet.id}
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe 'GET #new' do 
   it 'render new' do 
     get :new
     expect(assigns(:pet)).to be_a_new(Pet)
   end
  end
  
  describe ' POST create' do    

    let!(:valid_attributes) do 
      FactoryBot.attributes_for(:pet)
    end
    context 'with valid atributes' do
      it 'create a new pet ' do
        expect{post :create, params: { pet: valid_attributes}}.to change(Pet,:count).by(1)
      end
      it 'assings a newly created pet to @pet' do
        post :create, params: {pet: valid_attributes}
        expect(assigns(:pet)).to be_a(Pet) 
      end
      it 'redirects to created pet' do
        post :create, params: {pet: valid_attributes}
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to Pet.last 
      end
    end
  end

  describe ' Delete' do 
    before :each do 
      @pet = FactoryBot.create(:pet)
    end
    it 'destroy oki' do 
      expect {delete :destroy, params: {id: @pet}}.to change(Pet, :count).by (-1)
    end
  end
  
  describe 'PUT update' do 
    before :each do 
     @pet = FactoryBot.create(:pet)
    end
    it 'oki ptm?' do 
      put :update, params: {id: @pet, pet:FactoryBot.attributes_for(:pet)}
      assigns(:pet).should eq(@pet)
    end
    it 'oki ptm x2' do 
      put :update, params: {id: @pet, pet:FactoryBot.attributes_for(:pet, name:'ñoñoño')}
      @pet.reload
      @pet.name.should eq('ñoñoño')
    end
    it 'oki ptm x3' do 
      put :update, params: {id: @pet, pet: FactoryBot.attributes_for(:pet)}
      expect(response).to redirect_to (pet_path(@pet))
    end
  end

end
