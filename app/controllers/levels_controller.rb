class LevelsController < ApplicationController
  before_action :set_level, only: %i[ show edit update]

  def show
    @textbook = @level.textbook
  end

  def edit
  end

  def update
    if @level.update(level_params)
      redirect_to @level
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end

  def level_params
    params.expect(level: [ :level_icon, :title, :subtitle ])
  end
end
