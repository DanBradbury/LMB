class PagesController < ApplicationController
  def index
    render :text => 'OK'
  end

  def lookup
    @new_search = Search.new
    render 'pages/lookup'
  end
end
