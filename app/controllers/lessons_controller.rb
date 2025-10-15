class LessonsController < ApplicationController
  before_action :set_lesson, only: [ :show, :edit, :update, :destroy ]
  before_action :set_segment, only: [ :index, :new, :create ]

  def index
    @lessons = Lesson.where(segment_id: @segment)
    @selected_lesson = Lesson.find_by(id: params[:lesson_id]) || @lessons.first
  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @segment.lessons.build(lesson_params)

    if @lesson.save
      redirect_to @lesson
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @segment = @lesson.segment_id
    @lesson.destroy

    redirect_to segment_lessons_path(@segment)
  end

  private

  def lesson_params
    params.expect(lesson: [ :title, :introduction, :body, :summary ])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_segment
    @segment = Segment.find(params[:segment_id])
  end
end
