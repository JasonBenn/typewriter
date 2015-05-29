class Word < ActiveRecord::Base
  has_many :sentences
end
