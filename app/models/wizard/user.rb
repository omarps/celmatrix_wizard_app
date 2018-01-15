module Wizard
  module User
    STEPS = %w(step1 step2 step3 step4 step5).freeze
    COLORS = %w(Red Orange Yellow Green Blue Purple Other).freeze
    
    # Base class to avoid load all the user's attributes.
    class Base
      include ActiveModel::Model

      attr_accessor :user
      
      # map attributes to user
      delegate *::User.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :user
      
      # constructor
      def initialize(user_attributes)
        @user = ::User.new(user_attributes)
      end
    end
    
    # step 1: first_name and last_name
    class Step1 < Base
      validates :first_name, presence: true
      validates :last_name, presence: true
    end
    
    # step 2: step1 + email_address
    class Step2 < Step1
      # note: very basic email validation.
      validates :email_address, presence: true, format: { with: /@/ }
    end
    
    # step 3: step2 + age, height (feets and inches), and weight
    class Step3 < Step2
      validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: ::User::AGES.count }
      validates :height_feets, presence: true, numericality: { greater_than_or_equal_to: 0 }
      validates :height_inches, presence: true, numericality: { greater_than_or_equal_to: 0 }
      validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    end
    
    # step 4: step3 + favorite color
    class Step4 < Step3
      validates :favorite_color, presence: false, allow_blank: true
    end
    
    # step 5: step5 + final step
    class Step5 < Step4; end
  end
end