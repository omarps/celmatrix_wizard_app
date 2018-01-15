class WizardsController < ApplicationController
  before_action :load_user_wizard, except: [:index, :validate_step]

  def index
    @users = User.all
  end

  def validate_step
    current_step = params[:current_step]
    
    # TODO: refactor
    @user_wizard = wizard_user_for_step(current_step)
    @user_wizard.user.attributes = user_wizard_params
    # save session after commit.
    session[:user_attributes] = @user_wizard.user.attributes
    
    if @user_wizard.valid?
      next_step = wizard_user_next_step(current_step)
      # TODO: finish wizard
      # create and return unless next_step
      
      redirect_to action: next_step
    else
      render current_step
    end
  end
  
  private
  
  def load_user_wizard
    @user_wizard = wizard_user_for_step(action_name)
  end
  
  def wizard_user_next_step(step)
    Wizard::User::STEPS[Wizard::User::STEPS.index(step) + 1]
  end
  
  def wizard_user_for_step(step)
    raise InvalidStepError unless step.in?(Wizard::User::STEPS)
    
    "Wizard::User::#{step.camelize}".constantize.new(session[:user_attributes])
  end
  
  def user_wizard_params
    params.require(:user_wizard)
      .permit(:first_name, :last_name, :email_address, 
              :age, :height_feets, :height_inches, :weight,
              :favorite_color)
  end
  
  class InvalidStepError < StandardError; end
end
