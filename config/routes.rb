Rails.application.routes.draw do
  
  resource :wizard do
    get :step1
    get :step2
    get :step3
    get :step4

    post :validate_step
  end

  root 'wizards#index'
end
