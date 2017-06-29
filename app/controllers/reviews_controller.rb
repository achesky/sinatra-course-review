class ReviewsController < ApplicationController
  get "/reviews" do
    redirect_if_not_logged_in
    @reviews = Review.all
    erb :'reviews/index'
  end

  get "/reviews/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'reviews/new'
  end

end
