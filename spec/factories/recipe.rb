FactoryBot.define do
  factory :recipe do
    cooking_name {Faker::Lorem.word}
    ingredient {Faker::Lorem.sentence}
    process {Faker::Lorem.sentence}
    cook_time_id {2}
    genre_id {2}
    side_dishes_id {2}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.jpg'),filename: 'test.jpg')
    end

  end
end