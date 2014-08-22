class GamesController < AuthenticatedController

  def new
    @game = Game.new
  end

end
