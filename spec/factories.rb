FactoryGirl.define do
  factory :tag do
    name {Faker::Cat.name}
  end
  factory :comments do
    user
    content {Faker::Shakespeare.as_you_like_it_quote}
  end
  factory :user do
    sequence(:username) {|n| "#{Faker::Name.name}-#{n}"}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
  end

  factory :topic do
    title {Faker::HarryPotter.book + " - " + Faker::HarryPotter.character}
    content {Faker::HarryPotter.quote}
    user
    tag
  end
end