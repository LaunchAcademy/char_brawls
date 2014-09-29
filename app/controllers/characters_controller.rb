class CharactersController < ApplicationController
  before_filter :authenticate_user!, except: [:index,:show]
  before_filter :authorize_user!, except: [:index, :new, :show, :create]

  def index
    if params[:search]
      @characters = Character.search(params[:search].downcase).order("created_at DESC")
    else
      @characters = Character.page(params[:page]).per(10)
    end
  end

  def show
    @character = Character.find(params[:id])
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
