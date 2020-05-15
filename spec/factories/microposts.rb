FactoryBot.define do
  factory :micropost do
    title { "サンプル" }
    content { "サンプルデータです" }
    image { "sample.png" }
    rate { "5" }
    user_id { 1 }
  end
end
