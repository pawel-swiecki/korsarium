class Korsarium::SegmentsController < Korsarium::BaseController
  before_action :set_segment, only: %i[ show edit update destroy ]

  def index
    @segments = Segment.all
  end

  def show
    @levels = @segment.levels
  end

  def new
    @segment = Segment.new
  end

  def create
    @segment = Segment.new(segment_params)
    if @segment.save
      redirect_to korsarium_segment_path(@segment)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @segment.update(segment_params)
      redirect_to korsarium_segment_path(@segment)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_segment
    @segment = Segment.find(params[:id])
  end

  def segment_params
    params.expect(segment: [ :segment_icon, :title, :subtitle ])
  end
end
