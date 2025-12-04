class SegmentsController < ApplicationController
  before_action :set_segment, only: %i[show]

  def show
    @levels = @segment.levels
  end

  private

  def set_segment
    @segment = Segment.find(params[:id])
  end

  def segment_params
    params.expect(segment: [ :segment_icon, :title, :subtitle ])
  end
end
