class Korsarium::LevelsController < Korsarium::BaseController
  before_action :set_level, only: %i[ show edit update destroy ]
  before_action :set_segment, only: %i[ new create ]

  def index
  end

  def show
    @textbook = @level.textbook
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if @level.update(level_params)
      redirect_to @level
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
