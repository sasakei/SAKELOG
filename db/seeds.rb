User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar11",
             password_confirmation: "foobar11",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@sample.org"
  password = "password99"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
