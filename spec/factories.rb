FactoryGirl.define do  

  factory :upvote do
    value 1
  end

  factory :downvote do
    value 1
  end
  
  factory :sentence do
    sentence "Jason holds authentic sesquipedalians in the highest regard."
    word nil
    user nil
  end
  
  factory :word do
    word "Sesquipedalian"
    definition "One prone to using long words"
  end

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
