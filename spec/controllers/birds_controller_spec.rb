require 'rails_helper'

RSpec.describe BirdsController, type: :controller do

  describe "GET #index" do
    it "assigns all birds as @birds" do
      create(:bird, visible: true)
      birds = Bird.visible
      get :index
      expect(assigns(:birds)).to eq(birds)
    end
  end

  describe "GET #show" do
    it "assigns the requested bird as @bird" do
      bird = Bird.first || create(:bird)
      get :show, params: {id: bird.to_param}
      expect(assigns(:bird)).to eq(bird)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bird" do
        expect {
          post :create, params: {bird: attributes_for(:bird)}
        }.to change(Bird, :count).by(1)
      end

      it "assigns a newly created bird as @bird" do
        post :create, params: {bird: attributes_for(:bird)}
        expect(assigns(:bird)).to be_a(Bird)
        expect(assigns(:bird)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved bird as @bird" do
        post :create, params: {bird: attributes_for(:bird).except(:family)}
        expect(response.status).to eq(400)
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bird" do
      bird = create(:bird)
      expect {
        delete :destroy, params: {id: bird.to_param}
      }.to change(Bird, :count).by(-1)
    end
  end
end
