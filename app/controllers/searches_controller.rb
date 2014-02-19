class SearchesController < ApplicationController
  def new
    @s = Search.new
  end

  def create
    redirect_to results_path(:name => params[:search][:name])
  end

  def results
    init_client
    @summoner = @client.summoner_by_name(params[:name])
    @recent_games = @client.recent_games(@summoner.id)
    LolClient::Game

    logger.info "recent games: #{@recent_games.inspect}"
    render 'searches/results'
  end
end
