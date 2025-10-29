class SegmentsController < ApplicationController
  before_action :set_segment, only: %i[show edit]

  def show
    @levels = @segment.levels
  end

  def edit
  end

  private

  def set_segment
    @segment = Segment.find(params[:id])
  end
end
