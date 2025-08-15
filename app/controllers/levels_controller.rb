class LevelsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @levels = Level.where(course_id: @course)
    @selected_level = Level.find_by(id: params[:level_id]) || @levels.first
  end

  def show
    @level = Level.find(params[:id])
  end
end
