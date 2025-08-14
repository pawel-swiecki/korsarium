class SegmentsController < ApplicationController
  def index
    @segments = Segment.all
    @selected_segment = Segment.find_by(id: params[:segment_id]) || @segments.first
  end
end
