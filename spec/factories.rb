FactoryGirl.define do
  factory :jason, class: User do
    name 'Jason'
    password 'password'
    is_teacher false
  end  

  factory :teacher, class: User do
    name 'Wormwood'
    password 'password'
    is_teacher true
  end
end
