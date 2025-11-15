class LessonsController < ApplicationController
  def index
    @lessons = Lesson.find(params[:id])
  end

  def show
  end
end
