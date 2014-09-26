class MatchupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @matchups = Matchup.all
  end

  def show
    @matchup = Matchup.find(params[:id])
    @opinion = Opinion.new
  end

  def create
    @matchup = Matchup.new(matchup_params)

    if @matchup.save
      redirect_to matchups_path, notice: "The matchup has been created successfully."
    else
      flash[:notice] = "Your matchup could not be saved!"
      render 'new'
    end
  end

  def new
    @matchup = Matchup.new
  end

  private

  def matchup_params
    params.require(:matchup).permit(:character_id, :opponent_id)
  end
end