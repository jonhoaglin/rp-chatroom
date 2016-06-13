class UniversesController < ApplicationController
  def new
    @universe = Universe.new
  end

  def create
    @universe = Universe.new(universe_params)
    if @universe.save
      redirect_to @universe
    else
      flash[:danger] = "universe creation failed"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @universe = Universe.find_by_id(params[:id])
    @groups = @universe.groups
  end

  def index
    @universes = Universe.all
  end

  private
    def universe_params
      params.require(:universe).permit(:name)
    end
end
