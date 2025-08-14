class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @selected_lesson = Lesson.find_by(id: params[:lesson_id]) || @lessons.first
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    if @lesson.save
      redirect_to @lesson
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.expect(lesson: [ :title, :introduction, :body, :summary ])
  end
end
