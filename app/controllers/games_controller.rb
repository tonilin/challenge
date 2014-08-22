class GamesController < AuthenticatedController
  before_filter :find_game, :except => [:index, :new, :create]

  def index
    @games = Game.recent.all
    
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save

      current_user.participate!(@game)

      redirect_to game_path(@game)
    else
      render :new
    end 
  end

  def show
    @challengers = @game.participated_users
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

  def complete_form
    @user_game_result = UserGameResult.new

  end

  def complete
    @user_game_result = UserGameResult.find_by_game_id_and_user_id(@game.id, current_user.id)

    if !@user_game_result.present?
      @user_game_result = UserGameResult.new
    end

    @user_game_result.assign_attributes(user_game_result_params)
    @user_game_result.game = @game
    @user_game_result.user = current_user

    if @user_game_result.save
      redirect_to game_path(@game)
    else
      render :complete_form
    end
  end

  private

  def user_game_result_params
    params.require(:user_game_result).permit(:description, :image)
  end



  def game_params
    params.require(:game).permit(:title, :description)
  end

  def find_game
    @game = Game.find(params[:id])
  end

end
