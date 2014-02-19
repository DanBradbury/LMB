require 'lol_client'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def init_client
    @client = LolClient.new('12c41a10-86fc-4d16-934c-277e891e1519', :na)
  end
end
