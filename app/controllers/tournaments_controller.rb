class TournamentsController < ApplicationController
  before_action :set_tournament, except: [:index, :new, :create]
  before_action :authenticate_player!, except: [:index, :show]
  before_action :correct_user, except: [:index, :show]


  def index
    @tournaments = Tournament.all
    @bracket = Bracket.all

  end

  def show
    @bracket = Bracket.find_by(tournament_id: @tournament)
    @brackets = Bracket.where(tournament_id: @tournament)
    @activities = Activity.where(tournament_id: @tournament)
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
      @bracket = Bracket.last
      @bracket.count = 1
      @bracket.save
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
    @bracket = Bracket.find_by(:tournament_id => @tournament)
    @activities = Activity.where(:tournament_id => @tournament)

    # Add all players to array
    @players = Array.new 
    @activities.each do |activity| 
      @players << activity.player_id
    end

    # Find total number of players in tournament
    @total = @activities.count/2 
    if @total.odd?
      @total = @total -1
    end

    @check = Match.where(bracket_id:@bracket)

    # Take 2 players and create a match
    @total.times do
      @match = @bracket.matches.build 
      @gamers = @players.sample(2)
      @match.player_ids = @gamers
      if @check.last.blank?
        @match.matchDate = @tournament.gameDate
        @match.count = 1
      else
        @match.matchDate = @check.last.matchDate + 15.minutes
        @match.count = @check.last.count.next
      end
      @match.save
      @gamers.each do |gamer|
        @players.delete(gamer)
      end
    end

    redirect_to @tournament, notice: "Matches initalized."
  end

  def ascend
    @bracket_last = Bracket.find_by(tournament_id: @tournament)
    @matches = Match.where(bracket_id:@bracket_last)
    @winners = Array.new
    
    # Collect winners from previous Bracket
    @matches.each do |match|
      if match.flag?
        # Check
      else
        winner = match.winner
        # Convert back to ID
        @player = Player.find_by(evetag:winner)
        @winners << @player.id
      end
    end

    @total = @winners.count/2

    # Create new Bracket
    @bracket_count = @bracket_last.count
    @bracket = Bracket.new
    @bracket.tournament_id = @tournament.id
    @bracket.count = @bracket_count.next
    @bracket.save

    @check = Match.where(bracket_id:@bracket)
    @checkMatch = @bracket_last.matches.last

    @total.times do
      @match = @bracket.matches.build 
      @gamers = @winners.sample(2)
      @match.player_ids = @gamers
      if @check.last.blank?
        # Revisit
        @match.matchDate = @checkMatch.matchDate + 1.hour
        @match.count = 1
      else
        @match.matchDate = @check.last.matchDate + 15.minutes
        @match.count = @check.last.count.next
      end
      @match.save
      @gamers.each do |gamer|
        @winners.delete(gamer)
      end
    end
    redirect_to @bracket, notice: 'Ascended bracket.'
  end

  def declare_winner
    @bracket = Bracket.where(tournament_id:@tournament).last
    @match = Match.where(bracket_id:@bracket).last
    @tournament.winner = @match.winner
    @tournament.save

    redirect_to @tournament, notice: 'Declared winner.'
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
