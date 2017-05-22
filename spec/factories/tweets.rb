FactoryGirl.define do
  factory :tweet do
    association :user, factory: :user, strategy: :build
    sequence(:text) { |n| "Tweet Message #{n}" }

    trait :invalid do
      text nil
    end
  end
end
