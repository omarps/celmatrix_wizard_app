class User < ApplicationRecord
  enum age: [:_17_or_younger, :_18_25, :_26_35, :_36_45, :_46_or_older]
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
