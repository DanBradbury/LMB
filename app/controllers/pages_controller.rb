class PagesController < ApplicationController
  def index
    render 'index'
  end

  def lookup
    render 'lookup'
  end
end
