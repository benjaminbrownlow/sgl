class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_player!, except: [:index, :show]
  before_action :correct_user, except: [:index, :show]


  def index
    @tournaments = Tournament.all
    @bracket = Bracket.all
  end

  def show
  end

  def new
    @tournament = Tournament.new
    @bracket = Bracket.new
  end


  def edit
  end

  def create    
    @tournament = Tournament.new(tournament_params)
    @bracket = @tournament.brackets.build(params[:bracket])
    if @tournament.save
      redirect_to @tournament, notice: 'Tournament created'
    else
      redirect_to @tournament, notice: 'Error'
    end
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to @tournament, notice: 'Tournament was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.'
  end


  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def correct_user
      redirect_to tournaments_path unless current_player.admin?
    end

    def tournament_params
      params.require(:tournament).permit(:title, :description, :signUpDate, :gameDate)
    end
end
