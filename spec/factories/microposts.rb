FactoryBot.define do
  factory :micropost do
    title { "MyString" }
    content { "MyText" }
    image { "MyString" }
    rate { "5" }
    user { nil }
  end
end
