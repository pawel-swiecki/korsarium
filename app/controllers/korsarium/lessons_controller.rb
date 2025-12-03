class Korsarium::LessonsController < Korsarium::BaseController
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :set_textbook, only: %i[ new create ]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @textbook.lessons.build(lesson_params)
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
    @textbook = @lesson.textbook_id
    @lesson.destroy
    redirect_to @textbook
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_textbook
    @textbook = Textbook.find(params[:textbook_id])
  end

  def lesson_params
    params.expect(lesson: [ :title, :body, :introduction, :summary ])
  end
end
