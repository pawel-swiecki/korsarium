class SegmentsController < ApplicationController
  def show
    @segment = Segment.find(params[:id])
    @levels = @segment.levels
  end
end
