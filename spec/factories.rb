FactoryGirl.define do
  factory :user do
    handle { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation { |u| u.password }
  end


end
