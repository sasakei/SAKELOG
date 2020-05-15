FactoryBot.define do
  factory :user do
    name                  { 'sample' }
    password              { 'password1021' }
    password_confirmation { 'password1021' }
    email                 { 'example@example.com' }
  end
end
