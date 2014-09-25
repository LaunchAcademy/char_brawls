require 'opinions_controller'

class MatchupsController < ApplicationController
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

    # beacon = true
    # @matchup = Matchup.new

    # @matchup.character_id = params[:matchup][:character_id]
    # @matchup.opponent_id = params[:matchup][:opponent_id]

    # if @matchup.character_id == @matchup.opponent_id
    #   flash[:notice] = "A matchup must have two different characters."
    #   redirect_to new_matchup_path

    # elsif @matchup.character_id == nil
    #   flash[:notice] = "A matchup must have two different characters."
    #   redirect_to new_matchup_path

    # elsif @matchup.opponent_id == nil
    #   flash[:notice] = "A matchup must have two different characters."
    #   redirect_to new_matchup_path
    # end

    # @badmatchup = Matchup.where(character_id: @matchup.opponent_id)

    # if !@badmatchup.empty?
    #   if @badmatchup[0].opponent_id == @matchup.character_id
    #     flash[:notice] = "That matchup already exists!"

    #     @matchup.destroy
    #     redirect_to new_matchup_path
    #     beacon = false
    #   end
    # end

    # if beacon
    #   @matchup.save
    #   redirect_to matchups_path
    # end
  end

  def new
    @matchup = Matchup.new
  end

  private

  def matchup_params
    params.require(:matchup).permit(:character_id, :opponent_id)
  end
end
