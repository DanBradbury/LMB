class SearchesController < ApplicationController
  def create
    @s = Search.new(:name => params[:search][:name])
    redirect_to results_path(:name => @s.name)
  end

  def results
    if params[:name] == ''
      render 'searches/not_found'
      return
    end
    init_client
    @l = League.new
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
    @review = Review.new

    logger.info "recent games: #{@recent_games.inspect}"
    render 'searches/results'
  end

  def champions
    init_client
    @champions = @client.champions
    @l = League.new
    render 'searches/champions'
  end

  def client_check
    init_client
    inspection = @client.inspect
    render :json => inspection
  end

  def challenger_tt
    init_client
    league = @client.challenger_league(:RANKED_TEAM_3x3)
    render :json => league
  end

  def challenger_solo_sr
    init_client
    league = @client.challenger_league(:RANKED_SOLO_5x5)
    render :json => league
  end
end
