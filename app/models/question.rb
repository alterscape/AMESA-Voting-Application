class Question < ActiveRecord::Base
  belongs_to :ballot
  has_many :question_choices
end
