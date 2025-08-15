class SegmentsController < ApplicationController
  def index
    @level = Level.find(params[:level_id])
    @segments = Segment.where(level_id: @level)
    @selected_segment = Segment.find_by(id: params[:segment_id]) || @segments.first
  end

  def show
    @segment = Segment.find(params[:id])
  end
end
