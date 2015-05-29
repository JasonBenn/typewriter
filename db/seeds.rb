words = {
  "middling" => "mediocre; ordinary; commonplace; pedestrian: The restaurant's entrées are no better than middling.",
  "gainsay" => "to deny, dispute, or contradict.",
  "quidnunc" => "a person who is eager to know the latest news and gossip; a gossip or busybody.",
  "eternize" => "to make eternal; perpetuate.",
  "yestreen" => "during yesterday evening."
}

words.each do |word, definition|
  Word.create(
    word: word,
    definition: definition
  )
end

# teacher
User.create(
  name: 'teacher',
  password: 'pw',
  is_teacher: false
)

# non-random student
User.create(
  name: 'student',
  password: 'pw',
  is_teacher: false
)

# students
9.times do |n|
  number = n.to_s
  User.create(
    name: Faker::Name.first_name + number,
    password: 'pw',
    is_teacher: false
  )
end

def play_game(word)
  students = User.where(is_teacher: false)
  students.each do |user|
    user.sentences.create(
      sentence: Faker::Lorem.sentence,
      word_id: word.id
    )
  end

  word.sentences.each do |sentence|
    students.each do |student|
      if rand > 0.3  # 3 in 10 chance they don't vote
        sentence.ratings.create(
          value: [-1, 1, 1].sample,
          user_id: student.id
        )
      end
    end
  end
end

play_game(Word.find(1))
play_game(Word.find(2))
