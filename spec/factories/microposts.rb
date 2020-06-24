FactoryBot.define do
  factory :micropost do
    title { "酔鯨" }
    content { "友人がプレゼントしてくれた日本酒です" }
    # image { 'app/assets/images/default.png'　}
    rate { "5" }
    user_id { 1 }
  end
end
