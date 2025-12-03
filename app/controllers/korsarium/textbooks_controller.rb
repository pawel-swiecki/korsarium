class Korsarium::TextbooksController < Korsarium::BaseController
  before_action :set_textbook, only: %i[ show edit update destroy ]
  before_action :set_level, only: %i[ new create ]

  def index
    @textbooks = Textbook.all
  end

  def show
    @lessons = @textbook.lessons
  end

  def new
    @textbook = Textbook.new
  end

  def create
    @textbook = @level.textbooks.build(textbook_params)
    if @textbook.save
      redirect_to korsarium_textbook_path(@textbook)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @textbook.update(textbook_params)
      redirect_to korsarium_textbook_path(@textbook)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @level = @textbook.level_id
    @textbook.destroy
    redirect_to korsarium_level_path(@level)
  end

  private

  def set_textbook
    @textbook = Textbook.find(params[:id])
  end

  def set_level
    @level = Level.find(params[:level_id])
  end

  def textbook_params
    params.expect(textbook: [ :textbook_icon, :title, :subtitle ])
  end
end

