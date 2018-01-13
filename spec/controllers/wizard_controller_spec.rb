require 'rails_helper'

RSpec.describe WizardController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #validate_step" do
    it "returns http success" do
      get :validate_step
      expect(response).to have_http_status(:success)
    end
  end

end
