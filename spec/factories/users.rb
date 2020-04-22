FactoryBot.define do
  factory :user do
    name                  { 'sample' }
    password              { 'password' }
    password_confirmation { 'password' }
    sequence(:email) { Faker::Internet.email }
  end
end
