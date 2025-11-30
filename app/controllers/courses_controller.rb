class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy]

  def index
    @courses = Course.all
  end

  def show
    @segments = @course.segments
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.expect(course: [ :title, :subtitle, :course_icon ])
  end
end
