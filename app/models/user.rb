class User < ApplicationRecord
  AGES = [:_17_or_younger, :_18_25, :_26_35, :_36_45, :_46_or_older]
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  # note: very basic email validation.
  validates :email_address, presence: true, format: { with: /@/ }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: ::User::AGES.count }
  validates_presence_of :height_feets
  validates_numericality_of :height_feets, only_integer: true, greater_than_or_equal_to: 1
  validates_presence_of :height_inches
  validates_numericality_of :height_inches, only_integer: true, greater_than_or_equal_to: 1
  validates_numericality_of :weight, allow_nil: true, greater_than_or_equal_to: 1
  validates_presence_of :favorite_color
end
