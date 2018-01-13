Rails.application.routes.draw do
  
  resource :wizard do
    post :validate_step
  end

  root 'wizard#index'
end
