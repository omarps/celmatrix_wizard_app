# Future enhancement: Upgrade to FactoryBot
FactoryGirl.define do
  factory :user, class: User do
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    sequence(:email_address) { |n| "user#{n}@example.com"}
    age 0
    height_feets 5
    height_inches 7
    weight 20
    favorite_color "Purple"
  end
end