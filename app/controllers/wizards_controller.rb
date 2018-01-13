class WizardsController < ApplicationController
  before_action :load_user_wizard, except: [:index, :validate_step]

  def index
    @users = User.all
  end

  def validate_step
  end
  
  private
  
  def load_user_wizard
    @user_wizard = wizard_user_for_step(action_name)
  end
  
  # def wizard_user_next_step(step)
  #   Wizard::User::STEPS[Wizard::User::STEPS.index(step) + 1]
  # end
  
  def wizard_user_for_step(step)
    # TODO: validate
    
    "Wizard::User::#{step.camelize}".constantize.new(session[:user_attributes])
  end
end
