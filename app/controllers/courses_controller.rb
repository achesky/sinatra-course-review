class CoursesController < ApplicationController

  get "/courses" do
    redirect_if_not_logged_in
    @courses = Course.all
    erb :'courses/index'
  end

  get "/courses/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'courses/new'
  end

end
