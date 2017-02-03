FactoryGirl.define do
  factory :member do
    sequence(:first_name) {|n| "first name #{n}"}
    sequence(:last_name) {|n| "last name #{n}"}
    sequence(:email) {|n| "person#{n}@example.com"}
    sequence(:member_number) {|n| n}
    password 'robotpassword'
  end
end
