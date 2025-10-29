class LevelsController < ApplicationController
  def show
    @level = Level.find(params[:id])
    @textbook = @level.textbook
