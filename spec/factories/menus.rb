FactoryBot.define do
  factory :menu do
    main {Faker::Lorem.word}
    sub_one {Faker::Lorem.word}
    sub_two {Faker::Lorem.word}
    soup {Faker::Lorem.word}
  end
end
