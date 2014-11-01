class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @stories = @course.stories
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save
    redirect_to '/'
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    render :delete
  end

  private

  def course_params
    params.require(:course).permit([:user_id, :name])
  end


end
