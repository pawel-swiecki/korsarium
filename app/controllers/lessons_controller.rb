class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show ]
  before_action :set_textbook, only: %i[ index ]

  def index
    @lessons = Lesson.where(textbook_id: @textbook)
    @selected_lesson = Lesson.find_by(id: params[:lesson_id]) || @lesson.first
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def set_textbook
    @textbook = Textbook.find_by(params[:textbook_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
