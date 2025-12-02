class LevelsController < ApplicationController
  before_action :set_level, only: %i[ show ]

  def show
    @textbook = @level.textbook
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end

  def level_params
    params.expect(level: [ :level_icon, :title, :subtitle ])
  end
end
