class VoteController < ApplicationController
  before_filter :authenticate_voter!
  
  def ballot
    if user_voted?
      redirect_to :vote_error
      return
    else
      @ballot = Ballot.find_by_id params[:ballot_id]
    end
  end
  
  def index
    @ballots = Ballot.all
  end
  
  def submit_vote 
    if user_voted?
      redirect_to :vote_error
    else
      Ballot.transaction do 
        @ballot = Ballot.find_by_id params[:ballot_id]
        @ballot_votes = params[:ballot_form]
        @ballot_votes.each do |key,value|
          question = @ballot.questions.find_by_id(key)
          choice = question.question_choices.find_by_id(value, :lock => true)
          choice.increment!(:votes_for)
        end
        current_voter.ballots << @ballot
      end
    end
  end
  
  def error
  end
  
  private
  def user_voted?
    current_voter.ballots.include? Ballot.find_by_id(params[:ballot_id])
  end
end