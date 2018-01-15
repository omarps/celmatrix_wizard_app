require 'rails_helper'

RSpec.describe WizardsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @users = create_list(:user, 5)
      get :index
    end
    it "is succesful" do
      expect(response).to have_http_status(:success)
    end
    
    it "renders :index template" do
      expect(response).to render_template :index
    end
    
    it "returns the users" do
      expect(assigns(:users)).to match_array(@users)
    end
  end
  
  describe "GET #validate_step" do
    it "raises invalid step error" do
      expect { get :validate_step }.to raise_error(WizardsController::InvalidStepError)
    end
  end
  
  describe "GET #step1" do
    it "renders :step1 template" do
      get :step1
      expect(response).to render_template(:step1)
    end
  end
  
  describe "GET #step2" do
    it "renders :step2 template" do
      get :step2
      expect(response).to render_template(:step2)
    end
  end
  
  describe "GET #step3" do
    it "renders :step3 template" do
      get :step3
      expect(response).to render_template(:step3)
    end
  end
  
  describe "GET #step4" do
    it "renders :step4 template" do
      get :step4
      expect(response).to render_template(:step4)
    end
  end
  
  describe "GET #step5" do
    it "renders :step5 template" do
      get :step5
      expect(response).to render_template(:step5)
    end
  end

  describe "POST #validate_step" do
    describe "when is is succesful" do
      before(:each) do
        @user_wizard_params = (FactoryGirl.attributes_for(:user))
      end
      
      it "redirects from :step1 to :step2" do
        get :step1
        post :validate_step, params: { current_step: "step1", user_wizard: @user_wizard_params }
        expect(response).to redirect_to step2_wizard_url
      end
      
      it "redirects from :step2 to :step3" do
        get :step2
        post :validate_step, params: { current_step: "step2", user_wizard: @user_wizard_params }
        expect(response).to redirect_to step3_wizard_url
      end
      
      it "redirects from :step3 to :step4" do
        get :step3
        post :validate_step, params: { current_step: "step3", user_wizard: @user_wizard_params }
        expect(response).to redirect_to step4_wizard_url
      end
      
      it "redirects from :step4 to :step5" do
        get :step4
        post :validate_step, params: { current_step: "step4", user_wizard: @user_wizard_params }
        expect(response).to redirect_to step5_wizard_url
      end
      
      it "renders from :step5 to :index" do
        get :step4
        post :validate_step, params: { current_step: "step4", user_wizard: @user_wizard_params }
        post :validate_step, params: { current_step: "step5", user_wizard: @user_wizard_params }
        expect(response).to redirect_to root_path
      end
      
      it "renders from :step5 to :index" do
        get :step4
        post :validate_step, params: { current_step: "step4", user_wizard: @user_wizard_params }
        expect {
          post :validate_step, params: { current_step: "step5", user_wizard: @user_wizard_params }
        }.to change{ User.count }.by(1)
      end
      
      # Future steps: add state validation, notices, etc.
    end
    
    describe "when is not succesful" do
      it "is an invalid step error" do
        expect{ post :validate_step }.to raise_error(WizardsController::InvalidStepError)
      end
      # Future steps: add more validations: data, etc.
    end
  end

end
