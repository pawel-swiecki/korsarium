class Korsarium::LevelsController < Korsarium::BaseController
  before_action :set_level, only: %i[ show edit update destroy ]
  before_action :set_segment, only: %i[ new create ]

  def index
    @levels = Level.all
  end

  def show
    @textbooks = @level.textbooks
  end

  def new
    @level = Level.new
  end

  def create
    @level = @segment.levels.build(level_params)
    if @level.save
      redirect_to korsarium_level_path(@level)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @level.update(level_params)
      redirect_to korasium_level_path(@level)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @segment = @level.segment_id
    @level.destroy
    redirect_to korsarium_segment_path(@segment)
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end

  def set_segment
    @segment = Segment.find(params[:segment_id])
  end

  def level_params
    params.expect(level: [ :level_icon, :title, :subtitle ])
  end
end
