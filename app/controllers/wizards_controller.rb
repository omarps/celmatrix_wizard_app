class WizardsController < ApplicationController
  before_action :load_user_wizard, except: [:index, :validate_step]

  def index
    @users = User.order(id: :desc)
  end

  def validate_step
    current_step = params[:current_step]
    
    @user_wizard = wizard_user_for_step(current_step)
    next_step = wizard_user_next_step(current_step)
    if next_step.present?
      @user_wizard.user.attributes = user_wizard_params
      # save session after commit.
      session[:user_attributes] = @user_wizard.user.attributes
    end
    
    if @user_wizard.valid?
      # finish wizard
      create and return unless next_step
      
      redirect_to action: next_step
    else
      render current_step
    end
  end
  
  def create
    if @user_wizard.user.save
      # cleanup the session
      session[:user_attributes] = nil
      # redirect to root and report success.
      redirect_to root_path, notice: 'User succesfully created!'
    else
      # redirect to first step and report error.
      redirect_to({ action: Wizard::User::STEPS.first }, alert: 'There were a problem when creating the user.')
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
