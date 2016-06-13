class GroupsController < ApplicationController
  def new
    @universe = Universe.find_by_id(params[:universe_id])
    @group = @universe.groups.build
  end

  def create
    @universe = Universe.find_by_id(params[:universe_id])
    @group = @universe.groups.build(universe_params)
    if @group.save
      @member = @group.members.build(user: current_user, level: 'Creator', approved:true)
      @member.save
      redirect_to [@universe, @group]
    else
      flash[:danger] = "group creation failed"
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
    @universe = Universe.find_by_id(params[:universe_id])
    @group = @universe.groups.find_by_id(params[:id])
    @rooms = @group.rooms
  end

  def index
    @universe = Universe.find_by_id(params[:universe_id])
    @groups = @universe.groups
  end

  private
  def universe_params
    params.require(:group).permit(:name, :private, :hidden)
  end
end
