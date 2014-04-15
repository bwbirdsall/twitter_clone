FactoryGirl.define do
  factory :user do
    handle { Faker::Internet.user_name(nil, %w(_) ) }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation { |u| u.password }
  end

  factory :tweet do
    content { Faker::Lorem.words(6).join(" ") }
    user_id 2
  end

end
