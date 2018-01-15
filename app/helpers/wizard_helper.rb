module WizardHelper
  def age_values
    User::AGES.each_with_index.map { |age, idx| [I18n.t(age), idx] }
  end
  
  def selected_color
    return Wizard::User::COLORS.first if @user_wizard.user.favorite_color.nil? || @user_wizard.user.favorite_color == ""
    color = if Wizard::User::COLORS.include?(@user_wizard.user.favorite_color) then @user_wizard.user.favorite_color else "Other" end
    color
  end
end
