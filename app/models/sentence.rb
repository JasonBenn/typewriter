class Sentence < ActiveRecord::Base
  belongs_to :word
  belongs_to :user
  has_many :ratings

  validates :word, :user, presence: true
  validates :word, uniqueness: { scope: :user }
end
