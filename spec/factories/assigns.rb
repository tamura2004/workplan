FactoryGirl.define do
  factory :assign do
    association :group
    association :project
    association :system
    association :user
    association :month
    power "9.99"
  end
end
