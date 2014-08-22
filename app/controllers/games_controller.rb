class GamesController < AuthenticatedController
  before_filter :find_game, :except => [:index, :new, :create]

  def index
    @games = Game.all
    
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end 
  end

  def show
    
  end

  def join
    current_user.participate!(@game)


    flash[:notice] = "Join Success!"

    redirect_to game_path(@game)
  end

  def quit
    current_user.leave!(@game)

    flash[:notice] = "Leave Success!"

    redirect_to game_path(@game)
  end


  private

  def game_params
    params.require(:game).permit(:title, :description)
  end

  def find_game
    @game = Game.find(params[:id])
  end

end
