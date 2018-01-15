class User < ApplicationRecord
  AGES = [:_17_or_younger, :_18_25, :_26_35, :_36_45, :_46_or_older]
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  # note: very basic email validation.
  validates :email_address, presence: true, format: { with: /@/ }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: ::User::AGES.count }
  validates :height_feets, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :height_inches, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :favorite_color, presence: false, allow_nil: true
end
