class SegmentsController < ApplicationController
  def show
    @segment = Segment.find(params[:id])
  end
end
