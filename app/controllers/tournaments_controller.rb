class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  def index
    @tournaments = Tournament.all
    @bracket = Bracket.all
  end

  def show
  end

  def new
    @tournament = Tournament.new
    @bracket = Bracket.new
    @match = Match.new
  end


  def edit
  end

  def create    
    @tournament = Tournament.new(tournament_params)
    @bracket = @tournament.brackets.build(params[:bracket])
    # @bracket.bracket_number = 1
    @bracket.save
    @bracket = Bracket.last
    @match = @bracket.matches.build(params[:match])
    # @match.match_number = 1
    @match.save
    if @tournament.save
      redirect_to @tournament
    else
      render action: 'new'   
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
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:title, :description, :signUpDate, :gameDate)
    end

    def bracket_params
      params.require(:bracket).permit(:bracket_number, :tournament_id)
    end
end
