class OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new

    @opinion.body = params[:opinion][:body]
    @opinion.vote = params[:opinion][:vote]
    @opinion.matchup_id = params[:matchup_id]

    @opinion.save

    @matchup = Matchup.find(@opinion.matchup_id)
    redirect_to matchup_path(@matchup)
  end
end
