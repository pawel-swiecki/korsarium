class SegmentsController < ApplicationController
  before_action :set_level, only: [:index, :new]

  def index
    @segments = Segment.where(level_id: @level)
    @selected_segment = Segment.find_by(id: params[:segment_id]) || @segments.first
  end

  def show
    @segment = Segment.find(params[:id])
  end

  def new
    @segment = Segment.new
  end

  private

  def set_level
    @level = Level.find(params[:level_id])
  end
end
