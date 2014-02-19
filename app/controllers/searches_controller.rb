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
    leagues = @client.leagues(@summoner.id)
    divisions = {"BRONZE"=>0, "SILVER"=>1, "GOLD"=>2, "PLATINUM"=>3, "DIAMOND"=>4, "CHALLENGER"=>5}
    highest = -1
    leagues.each do |f|
      if divisions[f.tier] > highest
        highest = divisions[f.tier]
      end
    end
    @highest = divisions.invert[highest]

    logger.info "recent games: #{@recent_games.inspect}"
    render 'searches/results'
  end
end
