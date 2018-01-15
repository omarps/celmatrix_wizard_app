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
      validates_presence_of :first_name
      validates_presence_of :last_name
    end
    
    # step 2: step1 + email_address
    class Step2 < Step1
      # note: very basic email validation.
      validates :email_address, presence: true, format: { with: /@/ }
    end
    
    # step 3: step2 + age, height (feets and inches), and weight
    class Step3 < Step2
      validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: ::User::AGES.count }
      validates_presence_of :height_feets
      validates_numericality_of :height_feets, only_integer: true, greater_than_or_equal_to: 1
      validates_presence_of :height_inches
      validates_numericality_of :height_inches, only_integer: true, greater_than_or_equal_to: 1
      validates_numericality_of :weight, allow_nil: true, greater_than_or_equal_to: 1
    end
    
    # step 4: step3 + favorite color
    class Step4 < Step3
      validates_presence_of :favorite_color
    end
    
    # step 5: step5 + final step
    class Step5 < Step4; end
  end
end