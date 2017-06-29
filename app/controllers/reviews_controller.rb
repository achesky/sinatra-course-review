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

  get "/reviews/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @review = Review.find(params[:id])
    erb :'reviews/edit'
  end

  post "/reviews/:id" do
    redirect_if_not_logged_in
    @review = Review.find(params[:id])
    unless Review.valid_params?(params)
      redirect "/reviews/#{@review.id}/edit?error=invalid review"
    end
    @review.update(params.select{|k|k=="title" || k=="content" || k=="review_id"})
    redirect "/reviews/#{@review.id}"
  end

  get "/reviews/:id" do
    redirect_if_not_logged_in
    @review = Review.find(params[:id])
    erb :'reviews/show'
  end

  post "/reviews" do
    redirect_if_not_logged_in
    unless Review.valid_params?(params)
      redirect "/reviews/new?error=invalid review"
    end
    Review.create(params)
    redirect "/reviews"
  end

end
