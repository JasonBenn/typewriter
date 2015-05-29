class Rating < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :user

  validates :sentence, :user, presence: true
  validates :sentence, uniqueness: { scope: :user }
end
