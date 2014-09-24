class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end



  def create
    @review = Review.new
    @matchup = Matchup.find(params[:matchup_id])

    binding.pry

    if params(:vote)
      @matchup.votes += params(:vote).to_i
    end
    @matchup.save
    @review.save
  end

  def new
    @review = Review.new
  end
end
