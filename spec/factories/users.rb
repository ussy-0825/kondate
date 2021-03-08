FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { "testuser" }
    password_confirmation { password }
  end
end