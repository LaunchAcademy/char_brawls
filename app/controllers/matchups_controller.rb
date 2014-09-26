class MatchupsController < ApplicationController
    before_filter :authenticate_user!, except: [:index,:show]
    before_filter :authorize_user!, except: [:index, :new, :show, :create]

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

  def destroy
    binding.pry
    @matchup = Matchup.find(params[:id])
    @matchup.destroy
    redirect_to matchups_path
  end

  private

  def matchup_params
    params.require(:matchup).permit(:character_id, :opponent_id)
  end

   def authorize_user
    unless user_signed_in? and current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
