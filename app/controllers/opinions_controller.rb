class OpinionsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_user!, except: [:index, :new, :show, :create]

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
    @opinion.user = current_user
    @opinion.matchup = @matchup

    if @opinion.save
      redirect_to matchup_path(@matchup), notice: "The opinion has been created successfully."
    else
      render "matchups/show"
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:body, :winner_id)
  end

  def authorize_user
    unless user_signed_in? && current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
    end
  end
end
