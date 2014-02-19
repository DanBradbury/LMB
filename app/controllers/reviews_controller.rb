class ReviewsController < ApplicationController
  def new
    @r = Review.new
  end
end
