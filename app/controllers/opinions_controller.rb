class OpinionsController < ApplicationController
  before_action :authenticate_user!
  before_filter :authenticate_user!

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
    @opinion = Opinion.new(opinion_params)
    @matchup = Matchup.find(params[:matchup_id])
    @opinion.matchup = @matchup

    if @opinion.save
      redirect_to matchup_path(@matchup), notice: "The opinion has been created successfully."
    else
      render 'matchups/show'
    end

  end

  private
  def opinion_params
    params.require(:opinion).permit(:body, :winner_id) #.merge(matchup_id: params[:matchup_id])
  end
end



