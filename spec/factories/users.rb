FactoryBot.define do
  factory :user do
    name                  { 'sample' }
    password              { 'password1021' }
    password_confirmation { 'password1021' }
    sequence(:email) { Faker::Internet.email }
  end
end
