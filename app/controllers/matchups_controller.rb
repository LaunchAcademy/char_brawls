class MatchupsController < ApplicationController
  def index
    @matchups = Matchup.all
  end

  def show
    @matchup = Matchup.find(params[:id])
  end

  def create
    @matchup = Matchup.new
    if @matchup.character == @matchup.opponent
      flash[:notice] = "A matchup must have two different characters."
      redirect new_matchup_path

    elsif @matchup.character == nil
      flash[:notice] = "A matchup must have two different characters."
      redirect new_matchup_path

    elsif @matchup.opponent == nil
      flash[:notice] = "A matchup must have two different characters."
      redirect new_matchup_path
    end

    @matchup.save
  end

  def new
    @matchup = Matchup.new
  end
end
