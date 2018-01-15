module WizardHelper
  def age_values
    User::AGES.each_with_index.map { |age, idx| [I18n.t(age), idx] }
  end
end
