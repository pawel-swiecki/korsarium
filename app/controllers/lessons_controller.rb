class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show ]
  before_action :set_textbook, only: %i[ index ]

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
