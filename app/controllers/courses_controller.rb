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

  get "/courses/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @course = Course.find(params[:id])
    erb :'courses/edit'
  end

  post "/courses/:id" do
    redirect_if_not_logged_in
    @course = Course.find(params[:id])
    unless Course.valid_params?(params)
      redirect "/courses/#{@course.id}/edit?error=invalid course"
    end
    @course.update(params.select{|k|k=="professor" || k=="capacity"})
    redirect "/courses/#{@course.id}"
  end

  get "/courses/:id" do
    redirect_if_not_logged_in
    @course = Course.find(params[:id])
    erb :'courses/show'
  end

  post "/courses" do
    redirect_if_not_logged_in

    unless Course.valid_params?(params)
      redirect "/courses/new?error=invalid course"
    end
    Course.create(params)
    redirect "/courses"
  end

end
