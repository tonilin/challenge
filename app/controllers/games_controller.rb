class GamesController < AuthenticatedController
  before_filter :find_game, :only => [:show]

  def index
    @games = Game.all
    
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end 
  end

  def show
    
  end


  private

  def game_params
    params.require(:game).permit(:title, :description)
  end

  def find_game
    @game = Game.find(params[:id])
  end

end
