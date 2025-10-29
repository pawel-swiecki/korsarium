class SegmentsController < ApplicationController
  before_action :set_segment, only: %i[show edit update]

  def show
    @levels = @segment.levels
  end

  def edit
  end

  def update
    if @segment.update(segment_params)
      redirect_to @segment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_segment
    @segment = Segment.find(params[:id])
  end

  def segment_params
    params.expect(segment: [ :title, :segment_icon ])
  end
end
