FactoryGirl.define do
   factory :follow_request do
     association :sender,    factory: :user, strategy: :build
     association :recipient, factory: :user, strategy: :build
     status :pending

     trait :accepted do
       status :accepted
     end

     trait :rejected do
       status :rejected
     end

     trait :invalid do
       status nil
     end
   end
 end
