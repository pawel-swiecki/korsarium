class Korsarium::CoursesController < Korsarium::BaseController
  before_action :set_course, only: %i[ show edit update destroy ]

  def index
    @courses = Course.all
  end

  def show
    @segments = @course.segments
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to korsarium_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to korsarium_course_path(@course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to korsarium_courses_path
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.expect(course: [ :title, :subtitle, :course_icon ])
    end
end
