require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  
  it { is_expected.to validate_presence_of(:email_address) }
  it { is_expected.to allow_value('test@test.com').for(:email_address) }
  it { is_expected.not_to allow_value('test2test.com').for(:email_address) }
  
  it { is_expected.to validate_presence_of(:age) }
  it { is_expected.to validate_numericality_of(:age).only_integer }
  it { is_expected.to validate_numericality_of(:age).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:age).is_less_than_or_equal_to(::User::AGES.count) }
  
  it { is_expected.to validate_presence_of(:height_feets) }
  it { is_expected.to validate_numericality_of(:height_feets).is_greater_than_or_equal_to(1) }
  
  it { is_expected.to validate_presence_of(:height_inches) }
  it { is_expected.to validate_numericality_of(:height_inches).is_greater_than_or_equal_to(1) }
  
  it { is_expected.to allow_value(nil).for(:weight) }
  it { is_expected.to validate_numericality_of(:weight).is_greater_than_or_equal_to(1) }

  it { is_expected.to validate_presence_of(:favorite_color) }
end
