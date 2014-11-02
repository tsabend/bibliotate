class EnrollmentsController < ApplicationController

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.save
    redirect_to '/'
  end

  private

  def enrollment_params
    params.require(:enrollment).permit([:user_id, :course_id])
  end

end
