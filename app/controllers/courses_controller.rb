class CoursesController < ApplicationController

  get "/courses" do
    redirect_if_not_logged_in
    @user = User.find_by(params[:id])
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
    @course.update(params.select{|k|k=="professor" || k=="capacity"})
    @course.user_id = session[:id]
    redirect "/courses/#{@course.id}"
  end

  get "/courses/:id" do
    redirect_if_not_logged_in
    @course = Course.find(params[:id])
    erb :'courses/show'
  end


  post "/courses" do
    redirect_if_not_logged_in
    Course.create(professor: params[:professor], capacity: params[:capacity], user_id: session[:id])
    @courses = Course.all
    redirect "/courses"
  end

  delete '/courses/:id' do
    @course = Course.find_by_id(params[:id])
    if @course.user_id == session[:id]
      @course.destroy
    end
    redirect '/courses'
  end


end
