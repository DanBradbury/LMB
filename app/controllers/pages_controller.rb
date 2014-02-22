class PagesController < ApplicationController
  def index
    render :text => 'OK'
  end

  def lookup
    render 'pages/lookup'
  end
end
