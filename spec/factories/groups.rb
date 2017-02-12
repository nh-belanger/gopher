FactoryGirl.define do
  factory :group do
    sequence(:name) {|n| "test group #{n}"}
  end
end
