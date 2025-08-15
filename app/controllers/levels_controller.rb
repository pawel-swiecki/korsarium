class LevelsController < ApplicationController
  def index
    @levels = Level.all
    @selected_level = Level.find_by(id: params[:level_id]) || @levels.first
  end

  def show
    @level = Level.find(params[:id])
  end
end
