class LevelsController < ApplicationController
  before_action :set_level, only: %i[ show ]

  def show
    @textbooks = @level.textbooks
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end
end
