class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy, :initialize_match]
  before_action :authenticate_player!, except: [:index, :show]
  before_action :correct_user, except: [:index, :show]


  def index
    @tournaments = Tournament.all
    @bracket = Bracket.all

  end

  def show
    @bracket = Bracket.find_by(:tournament_id => @tournament)
    @activities = Activity.where(:tournament_id => @tournament)
    @match = Match.where(bracket_id: @bracket)    
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

  def initialize_match
    # @tournament = Tournament.find(params[:tournament_id])
    @bracket = Bracket.find_by(:tournament_id => @tournament)
    @activities = Activity.where(:tournament_id => @tournament)
    
    # Find total number of players in tournament
    @total = @activities.count/2 
    @players = Array.new 
    @gamer = Array.new

    # Add all players to array
    @activities.each do |activity| 
      @players << activity.player_id
    end

    # Take 2 players and create a match
    @total.times do
      @match = @bracket.matches.build 
        @gamers = @players.sample(2)
        @match.player_ids = @gamers
        @match.matchDate = @tournament.gameDate
      @match.save
      @gamers.each do |gamer|
        @players.delete(gamer)
      end
    end
    redirect_to tournaments_path, notice: "Matches initalized."
  end


  private
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def correct_user
      redirect_to tournaments_path unless current_player.admin?
    end

    def tournament_params
      params.require(:tournament).permit(:title, :description, :signUpDate, :gameDate, :image)
    end
end