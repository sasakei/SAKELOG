User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar11",
             password_confirmation: "foobar11",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.org"
  password = "password99"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end
