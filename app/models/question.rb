class Question < ActiveRecord::Base
  belongs_to :ballot
  has_many :question_choices
  accepts_nested_attributes_for :question_choices
end
