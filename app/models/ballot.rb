class Ballot < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for :questions
  has_and_belongs_to_many :voters
end
