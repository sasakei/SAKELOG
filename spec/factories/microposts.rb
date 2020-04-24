FactoryBot.define do
  factory :micropost do
    title { "MyString" }
    content { "MyText" }
    image { "MyString" }
    user { nil }
  end
end
