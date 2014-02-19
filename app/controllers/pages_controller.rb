class PagesController < ApplicationController
  def index
    render :text => 'OK'
  end

  def lookup
    init_client
    render :text => 'ok'
  end
end
