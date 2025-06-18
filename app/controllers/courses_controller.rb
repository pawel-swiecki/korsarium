class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.expect(course: [ :name, :subtitle ])
  end
end
